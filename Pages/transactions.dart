import 'package:flutter/material.dart';

import '../../../Widgets/customapp_bar.dart';


class TransactionScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {'title': 'Sedan - Toyota Camry', 'date': '24 Oct | 9:00 AM', 'amount': '-\$100.00'},
    {'title': 'SUV - Ford Explorer', 'date': '23 Oct | 8:00 AM', 'amount': '-\$150.00'},
    {'title': 'Convertible - BMW Z4', 'date': '22 Oct | 2:00 PM', 'amount': '-\$200.00'},
    {'title': 'Economy - Honda Civic', 'date': '22 Oct | 10:00 AM', 'amount': '-\$80.00'},
    {'title': 'Luxury - Mercedes S-Class', 'date': '21 Oct | 1:00 PM', 'amount': '-\$300.00'},
  ];

  TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const CustomAppBar(text: 'Your Rentals', text1: ''),
              _buildDateSection('Today'),
              _buildTransactionItem(transactions[0]),
              const SizedBox(height: 16.0),
              _buildDateSection('Yesterday'),
              _buildTransactionItem(transactions[1]),
              const SizedBox(height: 16.0),
              _buildDateSection('22 Oct 2023'),
              _buildTransactionItem(transactions[2]),
              const SizedBox(height: 5,),
              _buildTransactionItem(transactions[3]),
              const SizedBox(height: 16.0),
              _buildDateSection('21 Oct 2023'),
              _buildTransactionItem(transactions[4]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSection(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        date,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTransactionItem(Map<String, String> transaction) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction['title']!,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                transaction['date']!,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          Text(
            transaction['amount']!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
