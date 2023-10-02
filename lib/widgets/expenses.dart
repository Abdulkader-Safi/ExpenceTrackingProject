import 'package:exprense_tracker/models/expense.dart';
import 'package:exprense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:exprense_tracker/widgets/new_expense.dart';
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
      title: 'BreakFast',
      amount: 29.9,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Cinema',
      amount: 29.9,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _addExpanses(Expense expense) {
    setState(() {
      _registerExpanses.add(expense);
    });
  }

  void _removeExpanses(Expense expense) {
    setState(() {
      _registerExpanses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracking"),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (ctx) => NewExpense(
                onAddExpense: _addExpanses,
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ExpensesList(
                expenses: _registerExpanses,
                onRemoveExpenses: _removeExpanses,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
