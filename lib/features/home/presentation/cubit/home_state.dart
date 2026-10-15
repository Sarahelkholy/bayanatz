// States emitted while loading and filtering the dashboard collection.
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';
import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeFailure extends HomeState {
  const HomeFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({
    required this.dashboards,
    required this.visibleDashboards,
    required this.departments,
    required this.departmentCounts,
    required this.owningStateCounts,
    required this.searchQuery,
    required this.selectedDepartment,
    required this.selectedOwningState,
  });

  final List<DashboardEntity> dashboards;
  final List<DashboardEntity> visibleDashboards;
  final List<String> departments;
  final Map<String, int> departmentCounts;
  final Map<String, int> owningStateCounts;
  final String searchQuery;
  final String? selectedDepartment;
  final String? selectedOwningState;

  @override
  List<Object?> get props => [
    dashboards,
    visibleDashboards,
    departments,
    departmentCounts,
    owningStateCounts,
    searchQuery,
    selectedDepartment,
    selectedOwningState,
  ];
}
