import 'package:expensetrackerapp/core/appColors/app_colors.dart';
import 'package:expensetrackerapp/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  final Map<String, dynamic>? expense;

  const AddExpenseScreen({super.key, this.expense});

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = 'Food';

  final List<String> _categories = [
    'Food',
    'Transportation',
    'Entertainment',
    'Bills',
    'Shopping',
    'Others'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      // Populate fields if editing an expense
      _amountController.text = widget.expense!['amount'].toString();
      _descriptionController.text = widget.expense!['description'];
      _selectedDate = widget.expense!['date'];
      _selectedCategory = widget.expense!['category'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.expense == null ? 'Add Expense' : 'Edit Expense',
            style: Theme.of(context).textTheme.bodyLarge),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 16.0, left: 16.0, right: 16.0, bottom: 25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Amount Field
              TextFormField(
                controller: _amountController,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  prefixText: '\$ ',
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Category Dropdown
              _buildDropDownButton(),
              const SizedBox(height: 16),

              // Date Picker
              _buildDatePicker(),
              const SizedBox(height: 16),

              // Description Field
              TextFormField(
                controller: _descriptionController,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const Spacer(),
              // Submit Button
              CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Create expense object
                      final expense = {
                        'id':
                            widget.expense?['id'] ?? DateTime.now().toString(),
                        'amount': double.parse(_amountController.text),
                        'category': _selectedCategory,
                        'date': _selectedDate,
                        'description': _descriptionController.text,
                      };

                      // Return the expense object to the previous screen
                      Navigator.pop(context, expense);
                    }
                  },
                  buttonName:
                      widget.expense == null ? 'Add Expense' : 'Update Expense')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() {
            _selectedDate = picked;
          });
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Date',
          labelStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black),
          border: const OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('MMM dd, yyyy').format(_selectedDate),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Widget _buildDropDownButton() {
    return DropdownButtonFormField<String>(
      value: _selectedCategory,
      decoration: InputDecoration(
        labelText: 'Category',
        labelStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black),
        border: const OutlineInputBorder(),
      ),
      items: _categories.map((String category) {
        return DropdownMenuItem(
          value: category,
          child: Text(
            category,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedCategory = newValue;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
