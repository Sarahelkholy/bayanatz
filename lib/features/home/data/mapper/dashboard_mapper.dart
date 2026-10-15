import 'package:bayanatz/features/home/data/models/dashboard_model.dart';
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';

extension DashboardModelMapper on DashboardModel {
  DashboardEntity toEntity() {
    return DashboardEntity(
      id: id,
      owningStatus: owningStatus,
      boardName: boardName,
      departmentName: departmentName,
      description: description,
      createdAt: createdAt,
    );
  }
}

extension DashboardEntityMapper on DashboardEntity {
  DashboardModel toModel() {
    return DashboardModel(
      id: id,
      boardName: boardName,
      owningStatus: owningStatus,
      departmentName: departmentName,
      description: description,
      createdAt: createdAt,
    );
  }
}

