class DashboardEntity {
  final String? id;
  final String? boardName;
  final String? departmentName;
  final String? description;
  final DateTime? createdAt;
  final String? owningStatus;

  DashboardEntity({
    this.id,
    this.owningStatus,
    this.boardName,
    this.departmentName,
    this.description,
    this.createdAt,
  });
}
