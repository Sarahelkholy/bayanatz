import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';

sealed class HomeEvent {
  const HomeEvent();
}

// create dashboard events

final class CreateDashboardRequested extends HomeEvent {
  const CreateDashboardRequested({required this.dashboard});

  final DashboardEntity dashboard;
}

// get all dashboards events
final class GetDashboardsRequested extends HomeEvent {
  const GetDashboardsRequested();
}

// search dashboard events
final class SearchDashboardRequested extends HomeEvent {
  const SearchDashboardRequested({required this.dashboardName});

  final String dashboardName;
}

// filter dashboard events
final class FilterDashboardsRequested extends HomeEvent {
  const FilterDashboardsRequested({
    required this.createdAt,
    required this.departmentName,
    required this.owningStatus,
  });

  final DateTime createdAt;
  final String departmentName;
  final String owningStatus;
}
