// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'بيانات';

  @override
  String get home => 'الرئيسية';

  @override
  String get welcomeMessage => 'مرحبًا بك في بيانات!';

  @override
  String get homeSubtitle => 'استعرض لوحاتك وتحكم بها.';

  @override
  String get pageNotFound => 'الصفحة غير موجودة';

  @override
  String get taskManagement => 'إدارة المهام';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get connectionTimeoutMessage =>
      'انتهت مهلة الاتصال.\nيرجى التحقق من الإنترنت والمحاولة مرة أخرى.';

  @override
  String get searchDashboards => 'بحث';

  @override
  String dashboardCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count لوحة',
      many: '$count لوحة',
      few: '$count لوحات',
      two: 'لوحتان',
      one: 'لوحة واحدة',
      zero: 'لا توجد لوحات',
    );
    return '$_temp0';
  }

  @override
  String get filterByDepartment => 'القسم';

  @override
  String get filterByStatus => 'الحالة';

  @override
  String get allDepartments => 'كل الأقسام';

  @override
  String get allOwnership => 'كل أنواع الملكية';

  @override
  String get owner => 'مالك';

  @override
  String get contributor => 'مساهم';

  @override
  String get applyFilters => 'تطبيق';

  @override
  String get filters => 'تصفية';

  @override
  String get filterDialogDescription => 'صفِّ لوحات التحكم حسب القسم والملكية.';

  @override
  String get clearFilters => 'إعادة تعيين';

  @override
  String get noDashboards => 'لا توجد لوحات';

  @override
  String get noSearchResults => 'لا توجد لوحات تطابق البحث أو عوامل التصفية.';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get dashboardDetails => 'تفاصيل لوحة التحكم';

  @override
  String get department => 'القسم';

  @override
  String get status => 'الحالة';

  @override
  String get description => 'الوصف';

  @override
  String get createdAt => 'تاريخ الإنشاء';

  @override
  String get noDescription => 'لا يوجد وصف لهذه اللوحة.';

  @override
  String get close => 'إغلاق';

  @override
  String get untitledDashboard => 'لوحة بدون عنوان';

  @override
  String get createBoard => 'إنشاء لوحة';

  @override
  String get boardName => 'اسم اللوحة';

  @override
  String get departmentName => 'اسم القسم';

  @override
  String get owningStatus => 'حالة الملكية';

  @override
  String get cancel => 'إلغاء';

  @override
  String get create => 'إنشاء';

  @override
  String get pleaseEnterBoardName => 'يرجى إدخال اسم اللوحة';

  @override
  String get pleaseEnterDepartmentName => 'يرجى إدخال اسم القسم';

  @override
  String get pleaseSelectOwningStatus => 'يرجى اختيار حالة الملكية';

  @override
  String get pleaseEnterDescription => 'يرجى إدخال وصف';

  @override
  String get all => 'الكل';

  @override
  String get creationDate => 'تاريخ الإنشاء';

  @override
  String get noBoards => 'لا توجد لوحات';
}
