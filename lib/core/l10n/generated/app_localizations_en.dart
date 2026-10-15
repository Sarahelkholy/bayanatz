// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Bayanatz';

  @override
  String get home => 'Home';

  @override
  String get welcomeMessage => 'Welcome to Bayanatz!';

  @override
  String get homeSubtitle => 'Browse and manage your dashboards.';

  @override
  String get pageNotFound => 'Page not found';

  @override
  String get taskManagement => 'Task Management';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get connectionTimeoutMessage =>
      'Connection timeout.\nPlease check your internet connection and try again.';

  @override
  String get searchDashboards => 'Search';

  @override
  String dashboardCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dashboards',
      one: '$count dashboard',
      zero: 'No dashboards',
    );
    return '$_temp0';
  }

  @override
  String get filterByDepartment => 'Department';

  @override
  String get filterByStatus => 'Status';

  @override
  String get allDepartments => 'All departments';

  @override
  String get allOwnership => 'All ownership';

  @override
  String get owner => 'Owner';

  @override
  String get contributor => 'Contributor';

  @override
  String get applyFilters => 'Apply';

  @override
  String get filters => 'Filter';

  @override
  String get filterDialogDescription =>
      'Narrow dashboards by department and ownership.';

  @override
  String get clearFilters => 'Reset';

  @override
  String get noDashboards => 'No boards found';

  @override
  String get noSearchResults => 'No dashboards match your search or filters.';

  @override
  String get retry => 'Try again';

  @override
  String get dashboardDetails => 'Dashboard details';

  @override
  String get department => 'Department';

  @override
  String get status => 'Status';

  @override
  String get description => 'Description';

  @override
  String get createdAt => 'Created';

  @override
  String get noDescription => 'No description available for this board.';

  @override
  String get close => 'Close';

  @override
  String get untitledDashboard => 'Untitled dashboard';

  @override
  String get createBoard => 'Create Board';

  @override
  String get boardName => 'Board Name';

  @override
  String get departmentName => 'Department Name';

  @override
  String get owningStatus => 'Owning Status';

  @override
  String get cancel => 'Cancel';

  @override
  String get create => 'Create';

  @override
  String get pleaseEnterBoardName => 'Please enter a board name';

  @override
  String get pleaseEnterDepartmentName => 'Please enter department name';

  @override
  String get pleaseSelectOwningStatus => 'Please select owning status';

  @override
  String get pleaseEnterDescription => 'Please enter a description';

  @override
  String get all => 'All';

  @override
  String get creationDate => 'Creation Date';

  @override
  String get noBoards => 'No boards found';
}
