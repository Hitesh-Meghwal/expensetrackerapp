import 'package:expensetrackerapp/core/appColors/app_colors.dart';
import 'package:expensetrackerapp/core/appStrings/app_string.dart';
import 'package:expensetrackerapp/features/expense/presentation/pages/add_expense_tracker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Dummy data for expenses
  final List<Map<String, dynamic>> _expenses = [
    {
      'id': '1',
      'amount': 50.00,
      'date': DateTime.now(),
      'description': 'Grocery shopping',
      'category': 'Food'
    },
    {
      'id': '2',
      'amount': 30.00,
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'description': 'Transportation',
      'category': 'Travel'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double totalExpenses = _expenses.fold(
        0, (sum, expense) => sum + (expense['amount'] as double));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12),
            child: Text(
              "Hello, \n   Hitesh meghwal!!!",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black),
            ),
          ),
          // Summary Card
          _buildExpenseContainer(totalExpenses),
          // Expense List
          _buildExpenseList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpenseScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }

  Widget _buildExpenseList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _expenses.length,
        itemBuilder: (context, index) {
          final expense = _expenses[index];
          return Card(
            color: AppColors.primaryColor,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.darkGrey,
                child: Text(expense['category'][0],
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              title: Text(
                expense['description'],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                DateFormat('MMM dd, yyyy').format(expense['date']),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.darkGrey),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${expense['amount'].toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  PopupMenuButton(
                    iconColor: Colors.white,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          // Delay navigation to avoid popup menu error
                          Future.delayed(
                            const Duration(seconds: 0),
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddExpenseScreen(
                                  expense: expense,
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          setState(() {
                            _expenses.removeAt(index);
                          });
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildExpenseContainer(double totalExpenses) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            AppString.totalExpense,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${totalExpenses.toStringAsFixed(2)}',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
