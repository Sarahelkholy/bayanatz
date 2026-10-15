import 'package:bayanatz/core/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bayanatz/features/home/domain/entities/dashboard_entity.dart';
import 'package:bayanatz/features/home/presentation/cubit/home_cubit.dart';

class CreateBoardDialog extends StatefulWidget {
  const CreateBoardDialog({super.key});

  @override
  State<CreateBoardDialog> createState() => _CreateBoardDialogState();
}

class _CreateBoardDialogState extends State<CreateBoardDialog> {
  final _formKey = GlobalKey<FormState>();
  final _boardNameController = TextEditingController();
  final _departmentController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedOwningStatus;

  @override
  void dispose() {
    _boardNameController.dispose();
    _departmentController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          const Icon(Icons.note_add_outlined),
          const SizedBox(width: 8),
          Text(l10n.createBoard),
        ],
      ),
      content: SizedBox(
        width: 450,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Board Name
                TextFormField(
                  controller: _boardNameController,
                  decoration: InputDecoration(labelText: l10n.boardName),
                  validator: (value) => value == null || value.isEmpty
                      ? l10n.pleaseEnterBoardName
                      : null,
                ),
                const SizedBox(height: 16),

                // Department Name
                TextFormField(
                  controller: _departmentController,
                  decoration: InputDecoration(
                    labelText: l10n.departmentName,
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? l10n.pleaseEnterDepartmentName
                      : null,
                ),
                const SizedBox(height: 16),

                // Owning Status Dropdown
                DropdownButtonFormField<String>(
                  initialValue: _selectedOwningStatus,
                  decoration: InputDecoration(labelText: l10n.owningStatus),
                  items: HomeCubit.owningStateOptions.map((status) {
                    return DropdownMenuItem(value: status, child: Text(status));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedOwningStatus = value;
                    });
                  },
                  validator: (value) => value == null || value.isEmpty
                      ? l10n.pleaseSelectOwningStatus
                      : null,
                ),
                const SizedBox(height: 16),

                // Description
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: l10n.description,
                    alignLabelWithHint: true,
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? l10n.pleaseEnterDescription
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newDashboard = DashboardEntity(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                boardName: _boardNameController.text.trim(),
                departmentName: _departmentController.text.trim(),
                owningStatus: _selectedOwningStatus,
                description: _descriptionController.text.trim(),
                createdAt: DateTime.now(),
              );

              // Trigger creation via cubit
              context.read<HomeCubit>().createDashboard(newDashboard);

              Navigator.of(context).pop();
            }
          },
          child: Text(l10n.create),
        ),
      ],
    );
  }
}
