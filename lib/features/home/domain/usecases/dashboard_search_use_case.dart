import 'package:bayanatz/config/error_handling/result.dart';
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';
import 'package:bayanatz/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardSearchUsecase {
  final HomeRepo _repository;

  DashboardSearchUsecase(this._repository);

  Future<Result<List<DashboardEntity>>> call(String dashboardName) {
    return _repository.getDashboardByName(dashboardName);
  }
}
