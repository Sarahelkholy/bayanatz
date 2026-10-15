// Loads Firebase dashboards and owns home-page search and filter state.
import 'package:bayanatz/config/error_handling/result.dart';
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';
import 'package:bayanatz/features/home/domain/usecases/create_dashboard_usecase.dart';
import 'package:bayanatz/features/home/domain/usecases/get_dashboards_use_case.dart';
import 'package:bayanatz/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getDashboards, this._createDashboard)
    : super(const HomeInitial());

  static const owningStateOptions = ['Owner', 'Contributor'];

  final GetDashboardsUsecase _getDashboards;
  final CreateDashboardUsecase _createDashboard;

  List<DashboardEntity> _dashboards = const [];
  String _searchQuery = '';
  String? _selectedDepartment;
  String? _selectedOwningState;

  Future<void> loadDashboards() async {
    emit(const HomeLoading());
    final result = await _getDashboards.call();
    switch (result) {
      case Success<List<DashboardEntity>>():
        _dashboards = result.data;
        _emitLoaded();
      case Failure<List<DashboardEntity>>():
        emit(HomeFailure(result.errorMessage));
    }
  }

  void updateSearchQuery(String query) {
    _searchQuery = query.trim();
    _emitLoaded();
  }

  void updateDepartment(String? department) {
    _selectedDepartment = department;
    _emitLoaded();
  }

  void updateOwningState(String? owningState) {
    _selectedOwningState = owningState;
    _emitLoaded();
  }

  void clearFilters() {
    _selectedDepartment = null;
    _selectedOwningState = null;
    _emitLoaded();
  }

  Future<void> createDashboard(DashboardEntity dashboard) async {
    final result = await _createDashboard.call(dashboard: dashboard);
    switch (result) {
      case Success<DashboardEntity>():
        await loadDashboards(); // re-fetch fresh list from Firestore
      case Failure<DashboardEntity>():
        emit(HomeFailure(result.errorMessage));
    }
  }

  void _emitLoaded() {
    if (state is HomeFailure) return;

    final departments = _distinctValues(
      (dashboard) => dashboard.departmentName,
    );
    final departmentCounts = _countValues(
      (dashboard) => dashboard.departmentName,
    );
    final owningStateCounts = {
      for (final owningState in owningStateOptions)
        owningState: _dashboards
            .where(
              (dashboard) =>
                  _normalized(dashboard.owningStatus) ==
                  owningState.toLowerCase(),
            )
            .length,
    };
    final query = _searchQuery.toLowerCase();
    final visibleDashboards = _dashboards.where((dashboard) {
      final matchesQuery =
          query.isEmpty ||
          (dashboard.boardName?.toLowerCase().contains(query) ?? false);
      final matchesDepartment =
          _selectedDepartment == null ||
          dashboard.departmentName == _selectedDepartment;
      final matchesOwningState =
          _selectedOwningState == null ||
          _normalized(dashboard.owningStatus) ==
              _selectedOwningState!.toLowerCase();
      return matchesQuery && matchesDepartment && matchesOwningState;
    }).toList();

    emit(
      HomeLoaded(
        dashboards: List.unmodifiable(_dashboards),
        visibleDashboards: List.unmodifiable(visibleDashboards),
        departments: List.unmodifiable(departments),
        departmentCounts: Map.unmodifiable(departmentCounts),
        owningStateCounts: Map.unmodifiable(owningStateCounts),
        searchQuery: _searchQuery,
        selectedDepartment: _selectedDepartment,
        selectedOwningState: _selectedOwningState,
      ),
    );
  }

  List<String> _distinctValues(String? Function(DashboardEntity) getValue) {
    final values = _dashboards
        .map(getValue)
        .whereType<String>()
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toSet()
        .toList();
    values.sort(
      (first, second) => first.toLowerCase().compareTo(second.toLowerCase()),
    );
    return values;
  }

  Map<String, int> _countValues(String? Function(DashboardEntity) getValue) {
    final counts = <String, int>{};
    for (final dashboard in _dashboards) {
      final value = getValue(dashboard)?.trim();
      if (value != null && value.isNotEmpty) {
        counts.update(value, (count) => count + 1, ifAbsent: () => 1);
      }
    }
    return counts;
  }

  String? _normalized(String? value) => value?.trim().toLowerCase();
}
