import 'package:flutter/material.dart';
import 'package:salesmanagementapp/Widgets/customapp_bar.dart';

import '../../../Constants/colors.dart';



class PaymentsInvoicingScreen extends StatefulWidget {
  const PaymentsInvoicingScreen({super.key});

  @override
  PaymentsInvoicingScreenState createState() =>
      PaymentsInvoicingScreenState();
}

class PaymentsInvoicingScreenState extends State<PaymentsInvoicingScreen> {
  final List<Payment> _payments = [
    Payment(
      id: '1',
      payer: 'John Doe',
      amount: 500.0,
      date: DateTime.now(),
      status: 'Received',
    ),
    Payment(
      id: '2',
      payer: 'Jane Smith',
      amount: 300.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
      status: 'Pending',
    ),Payment(
      id: '1',
      payer: 'John Doe',
      amount: 500.0,
      date: DateTime.now(),
      status: 'Received',
    ),
    Payment(
      id: '2',
      payer: 'Jane Smith',
      amount: 300.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
      status: 'Pending',
    ),Payment(
      id: '1',
      payer: 'John Doe',
      amount: 500.0,
      date: DateTime.now(),
      status: 'Received',
    ),
    Payment(
      id: '2',
      payer: 'Jane Smith',
      amount: 300.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
      status: 'Pending',
    ),Payment(
      id: '1',
      payer: 'John Doe',
      amount: 500.0,
      date: DateTime.now(),
      status: 'Received',
    ),
    Payment(
      id: '2',
      payer: 'Jane Smith',
      amount: 300.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
      status: 'Pending',
    ),
  ];

  void _addPayment() {
    showDialog(
      context: context,
      builder: (_) {
        String? payerName;
        String? paymentStatus;
        double? amount;

        return AlertDialog(
          title: const Text('Add Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Payer Name'),
                onChanged: (value) => payerName = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) => amount = double.tryParse(value),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Status'),
                items: ['Received', 'Pending']
                    .map((status) => DropdownMenuItem(
                  value: status,
                  child: Text(status),
                ))
                    .toList(),
                onChanged: (value) => paymentStatus = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (payerName != null && amount != null && paymentStatus != null) {
                  setState(() {
                    _payments.add(
                      Payment(
                        id: DateTime.now().toString(),
                        payer: payerName!,
                        amount: amount!,
                        date: DateTime.now(),
                        status: paymentStatus!,
                      ),
                    );
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Invoice generateInvoice(Payment payment) {
    const taxRate = 0.1; // 10% Tax
    const discount = 20.0; // Flat discount

    double tax = payment.amount * taxRate;
    double total = payment.amount + tax - discount;

    return Invoice(
      invoiceId: 'INV-${DateTime.now().millisecondsSinceEpoch}',
      payer: payment.payer,
      items: [
        {'name': 'Service/Product', 'price': payment.amount, 'qty': 1},
      ],
      subtotal: payment.amount,
      tax: tax,
      discount: discount,
      totalAmount: total,
      date: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
             children: [
               const CustomAppBar(text: 'Payments and Invoicing', text1: ''),
               const SizedBox(height: 10,),
               Expanded(child: ListView.builder(
                 itemCount: _payments.length,
                 itemBuilder: (_, index) {
                   final payment = _payments[index];
                   final invoice = generateInvoice(payment); // Generate invoice on demand
                   return Card(
                     color: Colors.white,
                     elevation: 1,
                     child: ListTile(
                       leading: Image.asset('images/debitcard.png'),
                       title: Text(payment.payer),
                       subtitle: Text(
                         "Amount: \$${payment.amount.toStringAsFixed(2)} - ${payment.status}",
                       ),
                       trailing: Text(
                         payment.date.toString().split(' ')[0],
                         style: const TextStyle(color: Colors.grey),
                       ),
                       onTap: () {
                         // Show the invoice details on tap
                         showDialog(
                           context: context,
                           builder: (_) {
                             return AlertDialog(
                               title: const Text("Invoice Details"),
                               content: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   Text('Invoice ID: ${invoice.invoiceId}'),
                                   Text('Payer: ${invoice.payer}'),
                                   Text('Subtotal: \$${invoice.subtotal}'),
                                   Text('Tax: \$${invoice.tax}'),
                                   Text('Discount: \$${invoice.discount}'),
                                   Text('Total Amount: \$${invoice.totalAmount}'),
                                 ],
                               ),
                               actions: [
                                 TextButton(
                                   onPressed: () => Navigator.pop(context),
                                   child: const Text('Close'),
                                 ),
                               ],
                             );
                           },
                         );
                       },
                     ),
                   );
                 },
               ),)
        
             ],
        
        
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
        ),
        onPressed: () => _addPayment(),
        backgroundColor: AppColors.button2Color,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Payment Model
class Payment {
  final String id;
  final String payer;
  final double amount;
  final DateTime date;
  final String status; // 'Received' or 'Pending'

  Payment({
    required this.id,
    required this.payer,
    required this.amount,
    required this.date,
    required this.status,
  });
}

// Invoice Model
class Invoice {
  final String invoiceId;
  final String payer;
  final List<Map<String, dynamic>> items; // [{name: 'Item', price: 100.0, qty: 2}]
  final double subtotal;
  final double tax;
  final double discount;
  final double totalAmount;
  final DateTime date;

  Invoice({
    required this.invoiceId,
    required this.payer,
    required this.items,
    required this.subtotal,
    required this.tax,
    required this.discount,
    required this.totalAmount,
    required this.date,
  });

  double calculateTotal() {
    return subtotal + tax - discount;
  }
}
