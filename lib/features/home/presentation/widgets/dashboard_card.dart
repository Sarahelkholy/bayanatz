import 'package:bayanatz/core/helpers/my_responsive.dart';
import 'package:bayanatz/core/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';

class DashboardCardWidget extends StatelessWidget {
  const DashboardCardWidget({super.key, required this.dashboard});

  final DashboardEntity dashboard;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: MyResponsive.paddingAll(context, value: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(
          MyResponsive.radius(context, value: 16),
        ),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.description_outlined),
                    SizedBox(width: MyResponsive.width(context, value: 8)),
                    Expanded(
                      child: Text(
                        dashboard.boardName ?? l10n.untitledDashboard,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: MyResponsive.fontSize(context, value: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: MyResponsive.paddingSymmetric(
                  context,
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(
                    MyResponsive.radius(context, value: 6),
                  ),
                ),
                child: Text(
                  dashboard.owningStatus ?? l10n.owner,
                  style: theme.textTheme.labelSmall,
                ),
              ),
            ],
          ),
          SizedBox(height: MyResponsive.height(context, value: 6)),
          Text(
            '${l10n.department}: ${dashboard.departmentName ?? 'N/A'}',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: MyResponsive.height(context, value: 10)),
          Text(
            dashboard.description ?? l10n.noDescription,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${l10n.createdAt}: ${dashboard.createdAt?.toString().split(' ')[0] ?? 'N/A'}',
                style: theme.textTheme.labelSmall,
              ),
              const Text(
                '+6',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
