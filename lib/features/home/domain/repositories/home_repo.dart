import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';

import '../../../../config/error_handling/result.dart';

abstract interface class HomeRepo {
  Future<Result<DashboardEntity>> createDashboard(DashboardEntity dashboard);

  Future<Result<List<DashboardEntity>>> getDashboards();

  Future<Result<List<DashboardEntity>>> getDashboardByName(
    String dashboardName,
  );

  Future<Result<List<DashboardEntity>>> filterDashboards(
    DateTime createdAt,
    String departmentName,
    String owningStatus,
  );
}
