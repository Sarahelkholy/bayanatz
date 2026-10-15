import 'package:bayanatz/core/helpers/my_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bayanatz/features/home/presentation/cubit/home_cubit.dart';
import 'package:bayanatz/features/home/presentation/cubit/home_state.dart';

class FilterDialogWidget extends StatefulWidget {
  const FilterDialogWidget({super.key});

  @override
  State<FilterDialogWidget> createState() => _FilterDialogWidgetState();
}

class _FilterDialogWidgetState extends State<FilterDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String? _selectedDepartment;
  String? _selectedOwningState;

  @override
  void initState() {
    super.initState();
    final currentState = context.read<HomeCubit>().state;
    if (currentState is HomeLoaded) {
      _selectedDepartment = currentState.selectedDepartment;
      _selectedOwningState = currentState.selectedOwningState;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final homeState = context.watch<HomeCubit>().state;
    List<String> departments = [];
    if (homeState is HomeLoaded) {
      departments = homeState.departments;
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          MyResponsive.radius(context, value: 16),
        ), //[cite: 6]
      ),
      title: Row(
        children: [
          const Icon(Icons.tune),
          SizedBox(width: MyResponsive.width(context, value: 12)), //[cite: 6]
          Text('Filter', style: theme.textTheme.titleLarge),
        ],
      ),
      content: SizedBox(
        width: MyResponsive.width(context, value: 450), //[cite: 6]
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Creation Date Picker Field[cite: 1]
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Creation Date',
                  suffixIcon: const Icon(Icons.calendar_today_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      MyResponsive.radius(context, value: 8),
                    ), //[cite: 6]
                  ),
                ),
                controller: TextEditingController(
                  text: _selectedDate == null
                      ? ''
                      : _selectedDate.toString().split(' ')[0],
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
                validator: (value) {
                  // Optional field check validation rule
                  return null;
                },
              ),
              SizedBox(
                height: MyResponsive.height(context, value: 16),
              ), //[cite: 6]
              // Department Dropdown[cite: 1]
              DropdownButtonFormField<String>(
                value: _selectedDepartment,
                decoration: InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      MyResponsive.radius(context, value: 8),
                    ), //[cite: 6]
                  ),
                ),
                items: departments
                    .map(
                      (dept) =>
                          DropdownMenuItem(value: dept, child: Text(dept)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDepartment = value;
                  });
                },
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(
                height: MyResponsive.height(context, value: 16),
              ), //[cite: 6]
              // Owning Status Dropdown[cite: 1, 3]
              DropdownButtonFormField<String>(
                value: _selectedOwningState,
                decoration: InputDecoration(
                  labelText: 'Owning Status',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      MyResponsive.radius(context, value: 8),
                    ), //[cite: 6]
                  ),
                ),
                items: HomeCubit
                    .owningStateOptions //[cite: 3]
                    .map(
                      (status) =>
                          DropdownMenuItem(value: status, child: Text(status)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedOwningState = value;
                  });
                },
                validator: (value) {
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              _selectedDate = null;
              _selectedDepartment = null;
              _selectedOwningState = null;
            });
            context.read<HomeCubit>().clearFilters(); //[cite: 3]
            Navigator.of(context).pop();
          },
          child: const Text('Reset'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final cubit = context.read<HomeCubit>();
              cubit.updateDepartment(_selectedDepartment); //[cite: 3]
              cubit.updateOwningState(_selectedOwningState); //[cite: 3]
              Navigator.of(context).pop();
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MyResponsive.radius(context, value: 8),
              ), //[cite: 6]
            ),
          ),
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
