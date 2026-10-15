import 'package:bayanatz/config/error_handling/result.dart';
import 'package:bayanatz/features/home/data/datasources/home_data_source.dart';
import 'package:bayanatz/features/home/data/mapper/dashboard_mapper.dart';
import 'package:bayanatz/features/home/data/models/dashboard_model.dart';
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';
import 'package:bayanatz/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDataSource _homeDataSource;

  HomeRepoImpl(this._homeDataSource);

  @override
  Future<Result<DashboardEntity>> createDashboard(
    DashboardEntity dashboard,
  ) async {
    final result = await _homeDataSource.createDashboard(
      dashboard.toModel(),
    );
    switch (result) {
      case Success<DashboardModel> success:
        return Success<DashboardEntity>(data: success.data.toEntity());
      case Failure<DashboardModel> failure:
        return Failure<DashboardEntity>(errorMessage: failure.errorMessage);
    }
  }

  @override
  Future<Result<List<DashboardEntity>>> getDashboards() async {
    final result = await _homeDataSource.getDashboards();
    switch (result) {
      case Success<List<DashboardModel>> success:
        return Success<List<DashboardEntity>>(
          data: success.data.map((e) => e.toEntity()).toList(),
        );
      case Failure<List<DashboardModel>> failure:
        return Failure<List<DashboardEntity>>(
          errorMessage: failure.errorMessage,
        );
    }
  }

  @override
  Future<Result<List<DashboardEntity>>> getDashboardByName(
    String dashboardName,
  ) async {
    final result = await _homeDataSource.getDashboardByName(dashboardName);
    switch (result) {
      case Success<List<DashboardModel>> success:
        return Success<List<DashboardEntity>>(
          data: success.data.map((e) => e.toEntity()).toList(),
        );
      case Failure<List<DashboardModel>> failure:
        return Failure<List<DashboardEntity>>(
          errorMessage: failure.errorMessage,
        );
    }
  }

  @override
  Future<Result<List<DashboardEntity>>> filterDashboards(
    DateTime createdAt,
    String departmentName,
    String owningStatus,
  ) {
    return _homeDataSource
        .filterDashboards(createdAt, departmentName, owningStatus)
        .then((result) {
          switch (result) {
            case Success<List<DashboardModel>> success:
              return Success<List<DashboardEntity>>(
                data: success.data.map((e) => e.toEntity()).toList(),
              );
            case Failure<List<DashboardModel>> failure:
              return Failure<List<DashboardEntity>>(
                errorMessage: failure.errorMessage,
              );
          }
        });
  }
}
