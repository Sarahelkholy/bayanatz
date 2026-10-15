import 'package:bayanatz/core/cubit/locale_cubit.dart';
import 'package:bayanatz/core/l10n/generated/app_localizations.dart';
import 'package:bayanatz/core/helpers/my_responsive.dart';
import 'package:bayanatz/features/home/presentation/widgets/create_board_dialog.dart';
import 'package:bayanatz/features/home/presentation/widgets/dashboard_card.dart';
import 'package:bayanatz/features/home/presentation/widgets/filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bayanatz/features/home/presentation/cubit/home_cubit.dart';
import 'package:bayanatz/features/home/presentation/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth > 800;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: MyResponsive.paddingAll(context, value: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      l10n.taskManagement,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: MyResponsive.fontSize(context, value: 24),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle Dashboard action
                    },
                    icon: const Icon(Icons.dashboard_outlined),
                    label: Text(l10n.dashboard),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size(0, 40),
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                      foregroundColor: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 8),
                  BlocBuilder<LocaleCubit, Locale>(
                    builder: (context, locale) {
                      final isArabic = locale.languageCode == 'ar';
                      return Tooltip(
                        message: isArabic ? 'Switch to English' : 'التبديل إلى العربية',
                        child: InkWell(
                          onTap: () => context.read<LocaleCubit>().toggle(),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: theme.colorScheme.outline.withValues(alpha: 0.4),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  isArabic ? '🇬🇧' : '🇸🇦',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  isArabic ? 'EN' : 'AR',
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: MyResponsive.height(context, value: 24)),

              // Category Tabs / Filter Chips with dynamic counts
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  List<String> departments = [];
                  Map<String, int> departmentCounts = {};
                  int totalDashboards = 0;
                  String? selectedDept;

                  if (state is HomeLoaded) {
                    departments = state.departments;
                    departmentCounts = state.departmentCounts;
                    totalDashboards = state.dashboards.length;
                    selectedDept = state.selectedDepartment;
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryChip(
                          context,
                          l10n.all,
                          totalDashboards.toString(),
                          selectedDept == null,
                          () =>
                              context.read<HomeCubit>().updateDepartment(null),
                        ),
                        ...departments.map((dept) {
                          final count = departmentCounts[dept] ?? 0;
                          return _buildCategoryChip(
                            context,
                            dept,
                            count.toString(),
                            selectedDept == dept,
                            () => context.read<HomeCubit>().updateDepartment(
                              dept,
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: MyResponsive.height(context, value: 20)),

              // Search Bar & Filter Actions (Responsive for both mobile & desktop)
              if (isDesktop)
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        onChanged: (query) =>
                            context.read<HomeCubit>().updateSearchQuery(query),
                        decoration: InputDecoration(
                          hintText: l10n.searchDashboards,
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              MyResponsive.radius(context, value: 12),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.3),
                        ),
                      ),
                    ),
                    SizedBox(width: MyResponsive.width(context, value: 12)),
                    OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) => BlocProvider.value(
                            value: context.read<HomeCubit>(),
                            child: const FilterDialogWidget(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.tune),
                      label: Text(l10n.filters),
                      style: OutlinedButton.styleFrom(
                        padding: MyResponsive.paddingSymmetric(
                          context,
                          horizontal: 16,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            MyResponsive.radius(context, value: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MyResponsive.width(context, value: 12)),
                    ElevatedButton.icon(
                      onPressed: () => _showCreateBoardDialog(context),
                      icon: const Icon(Icons.note_add_outlined),
                      label: Text(l10n.createBoard),
                      style: ElevatedButton.styleFrom(
                        padding: MyResponsive.paddingSymmetric(
                          context,
                          horizontal: 16,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            MyResponsive.radius(context, value: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      onChanged: (query) =>
                          context.read<HomeCubit>().updateSearchQuery(query),
                      decoration: InputDecoration(
                        hintText: l10n.searchDashboards,
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            MyResponsive.radius(context, value: 12),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: theme.colorScheme.surfaceContainerHighest
                            .withValues(alpha: 0.3),
                      ),
                    ),
                    SizedBox(height: MyResponsive.height(context, value: 12)),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (dialogContext) => BlocProvider.value(
                                  value: context.read<HomeCubit>(),
                                  child: const FilterDialogWidget(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.tune),
                            label: Text(l10n.filters),
                            style: OutlinedButton.styleFrom(
                              padding: MyResponsive.paddingSymmetric(
                                context,
                                horizontal: 16,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  MyResponsive.radius(context, value: 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MyResponsive.width(context, value: 12)),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _showCreateBoardDialog(context),
                            icon: const Icon(Icons.note_add_outlined),
                            label: Text(l10n.createBoard),
                            style: ElevatedButton.styleFrom(
                              padding: MyResponsive.paddingSymmetric(
                                context,
                                horizontal: 16,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  MyResponsive.radius(context, value: 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              SizedBox(height: MyResponsive.height(context, value: 24)),

              // Dashboard Cards Grid (Responsive layout)
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeFailure) {
                    return Center(child: Text(state.message));
                  } else if (state is HomeLoaded) {
                    if (state.visibleDashboards.isEmpty) {
                      return Center(child: Text(l10n.noDashboards));
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenWidth > 1200
                            ? 3
                            : screenWidth > 700
                            ? 2
                            : 1,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 220,
                      ),
                      itemCount: state.visibleDashboards.length,
                      itemBuilder: (context, index) {
                        final dashboard = state.visibleDashboards[index];
                        return DashboardCardWidget(dashboard: dashboard);
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateBoardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<HomeCubit>(),
        child: const CreateBoardDialog(),
      ),
    );
  }

  Widget _buildCategoryChip(
    BuildContext context,
    String label,
    String count,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: EdgeInsets.only(right: MyResponsive.width(context, value: 12)),
      child: ChoiceChip(
        label: Text('$count   $label'),
        selected: isSelected,
        onSelected: (_) => onTap(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            MyResponsive.radius(context, value: 12),
          ),
        ),
      ),
    );
  }
}
