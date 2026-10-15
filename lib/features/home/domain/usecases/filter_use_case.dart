import 'package:bayanatz/config/error_handling/result.dart';
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';
import 'package:bayanatz/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FilterDashboardsUsecase {
  final HomeRepo _repository;

  FilterDashboardsUsecase(this._repository);

  Future<Result<List<DashboardEntity>>> call({
    required DateTime createdAt,
    required String departmentName,
    required String owningStatus,
  }) {
    return _repository.filterDashboards(
      createdAt,
      departmentName,
      owningStatus,
    );
  }
}
