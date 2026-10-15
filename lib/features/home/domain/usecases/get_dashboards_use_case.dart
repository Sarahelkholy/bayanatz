import 'package:bayanatz/config/error_handling/result.dart';
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';
import 'package:bayanatz/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDashboardsUsecase {
  final HomeRepo _repository;

  GetDashboardsUsecase(this._repository);

  Future<Result<List<DashboardEntity>>> call() {
    return _repository.getDashboards();
  }
}
