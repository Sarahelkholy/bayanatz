import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Bayanatz'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Bayanatz!'**
  String get welcomeMessage;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse and manage your dashboards.'**
  String get homeSubtitle;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get pageNotFound;

  /// No description provided for @taskManagement.
  ///
  /// In en, this message translates to:
  /// **'Task Management'**
  String get taskManagement;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @connectionTimeoutMessage.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout.\nPlease check your internet connection and try again.'**
  String get connectionTimeoutMessage;

  /// No description provided for @searchDashboards.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchDashboards;

  /// No description provided for @dashboardCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No dashboards} one{{count} dashboard} other{{count} dashboards}}'**
  String dashboardCount(int count);

  /// No description provided for @filterByDepartment.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get filterByDepartment;

  /// No description provided for @filterByStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get filterByStatus;

  /// No description provided for @allDepartments.
  ///
  /// In en, this message translates to:
  /// **'All departments'**
  String get allDepartments;

  /// No description provided for @allOwnership.
  ///
  /// In en, this message translates to:
  /// **'All ownership'**
  String get allOwnership;

  /// No description provided for @owner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get owner;

  /// No description provided for @contributor.
  ///
  /// In en, this message translates to:
  /// **'Contributor'**
  String get contributor;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get applyFilters;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filters;

  /// No description provided for @filterDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'Narrow dashboards by department and ownership.'**
  String get filterDialogDescription;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get clearFilters;

  /// No description provided for @noDashboards.
  ///
  /// In en, this message translates to:
  /// **'No boards found'**
  String get noDashboards;

  /// No description provided for @noSearchResults.
  ///
  /// In en, this message translates to:
  /// **'No dashboards match your search or filters.'**
  String get noSearchResults;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @dashboardDetails.
  ///
  /// In en, this message translates to:
  /// **'Dashboard details'**
  String get dashboardDetails;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @createdAt.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get createdAt;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'No description available for this board.'**
  String get noDescription;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @untitledDashboard.
  ///
  /// In en, this message translates to:
  /// **'Untitled dashboard'**
  String get untitledDashboard;

  /// No description provided for @createBoard.
  ///
  /// In en, this message translates to:
  /// **'Create Board'**
  String get createBoard;

  /// No description provided for @boardName.
  ///
  /// In en, this message translates to:
  /// **'Board Name'**
  String get boardName;

  /// No description provided for @departmentName.
  ///
  /// In en, this message translates to:
  /// **'Department Name'**
  String get departmentName;

  /// No description provided for @owningStatus.
  ///
  /// In en, this message translates to:
  /// **'Owning Status'**
  String get owningStatus;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @pleaseEnterBoardName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a board name'**
  String get pleaseEnterBoardName;

  /// No description provided for @pleaseEnterDepartmentName.
  ///
  /// In en, this message translates to:
  /// **'Please enter department name'**
  String get pleaseEnterDepartmentName;

  /// No description provided for @pleaseSelectOwningStatus.
  ///
  /// In en, this message translates to:
  /// **'Please select owning status'**
  String get pleaseSelectOwningStatus;

  /// No description provided for @pleaseEnterDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter a description'**
  String get pleaseEnterDescription;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @creationDate.
  ///
  /// In en, this message translates to:
  /// **'Creation Date'**
  String get creationDate;

  /// No description provided for @noBoards.
  ///
  /// In en, this message translates to:
  /// **'No boards found'**
  String get noBoards;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
