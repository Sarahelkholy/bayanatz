import 'package:bayanatz/config/error_handling/result.dart';
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';
import 'package:bayanatz/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateDashboardUsecase {
  final HomeRepo _repository;

  CreateDashboardUsecase(this._repository);

  Future<Result<DashboardEntity>> call({required DashboardEntity dashboard}) {
    return _repository.createDashboard(dashboard);
  }
}
