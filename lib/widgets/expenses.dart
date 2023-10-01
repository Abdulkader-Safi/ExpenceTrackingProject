import 'package:exprense_tracker/models/expense.dart';
import 'package:exprense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpanses = [
    Expense(
      title: 'Flutter Course 1',
      amount: 29.9,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Flutter Course 2',
      amount: 29.9,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Flutter Course 3',
      amount: 29.9,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Flutter Course 4',
      amount: 29.9,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracking"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => const SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Text("data"),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('...'),
            Expanded(
              child: ExpensesList(
                expenses: _registerExpanses,
              ),
            ),
            const Text('...'),
          ],
        ),
      ),
    );
  }
}
