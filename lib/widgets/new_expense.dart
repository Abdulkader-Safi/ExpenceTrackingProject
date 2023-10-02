import 'dart:developer';

import 'package:exprense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Category _SelectedCategory = Category.food;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select Date"
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate = DateTime(now.year - 1);
                        final DateTime? pickDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: firstDate,
                          lastDate: now,
                        );
                        setState(() {
                          _selectedDate = pickDate;
                        });
                      },
                      icon: const Icon(Icons.calculate),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DropdownButton(
                value: _SelectedCategory,
                icon: const Icon(Icons.arrow_downward),
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (newCat) {
                  setState(() {
                    if (newCat == null) {
                      return;
                    }
                    _SelectedCategory = newCat;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  final double? enteredAmount =
                      double.tryParse(_amountController.text);
                  final bool amountIsInvalid =
                      enteredAmount == null || enteredAmount <= 0;

                  if (_titleController.text.trim().isEmpty ||
                      amountIsInvalid ||
                      _selectedDate == null) {
                    // TODO: show error message to user
                    log("Error");
                  }
                },
                child: const Text("Save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
