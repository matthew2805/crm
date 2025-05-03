import 'package:flutter/material.dart';
import 'package:salesmanagementapp/Constants/colors.dart';
import 'package:salesmanagementapp/Widgets/customapp_bar.dart';

class Order {
  final int id;
  late final String customerName;
  late final String orderDate;
  late final double amount;
  late final String status;

  Order({
    required this.id,
    required this.customerName,
    required this.orderDate,
    required this.amount,
    required this.status,
  });
}

class OrderManagementScreen extends StatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  OrderManagementScreenState createState() => OrderManagementScreenState();
}

class OrderManagementScreenState extends State<OrderManagementScreen> {
  final List<Order> _orders = [
    Order(
      id: 1,
      customerName: "Иванов Иван",
      orderDate: "20.11.2024",
      amount: 29999.99,
      status: "В обработке",
    ),
    Order(
      id: 2,
      customerName: "Петрова Анна",
      orderDate: "19.11.2024",
      amount: 15949.50,
      status: "Доставлен",
    ),
    Order(
      id: 3,
      customerName: "Сидоров Алексей",
      orderDate: "18.11.2024",
      amount: 45000.00,
      status: "Ожидает оплаты",
    ),
    Order(
      id: 4,
      customerName: "Кузнецова Елена",
      orderDate: "17.11.2024",
      amount: 12500.75,
      status: "Отменен",
    ),
    Order(
      id: 5,
      customerName: "Смирнов Дмитрий",
      orderDate: "16.11.2024",
      amount: 33450.00,
      status: "В пути",
    ),
    Order(
      id: 6,
      customerName: "Васильева Ольга",
      orderDate: "15.11.2024",
      amount: 7899.90,
      status: "Частично выполнен",
    ),
  ];

  void _showOrderForm([Order? order]) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? customerName = order?.customerName;
    String? orderDate = order?.orderDate;
    String? status = order?.status;
    String? amount = order?.amount.toString();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(order == null ? "Добавить заказ" : "Редактировать заказ"),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: customerName,
                  decoration: const InputDecoration(labelText: "Имя клиента"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Обязательное поле"
                      : null,
                  onSaved: (value) => customerName = value,
                ),
                TextFormField(
                  initialValue: orderDate,
                  decoration: const InputDecoration(labelText: "Дата заказа"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Обязательное поле"
                      : null,
                  onSaved: (value) => orderDate = value,
                ),
                TextFormField(
                  initialValue: amount,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Сумма (₽)"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Обязательное поле"
                      : null,
                  onSaved: (value) => amount = value,
                ),
                TextFormField(
                  initialValue: status,
                  decoration: const InputDecoration(labelText: "Статус"),
                  onSaved: (value) => status = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Отмена"),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  setState(() {
                    if (order == null) {
                      _orders.add(Order(
                        id: _orders.length + 1,
                        customerName: customerName!,
                        orderDate: orderDate!,
                        amount: double.parse(amount!),
                        status: status!,
                      ));
                    } else {
                      order.customerName = customerName!;
                      order.orderDate = orderDate!;
                      order.amount = double.parse(amount!);
                      order.status = status!;
                    }
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Сохранить"),
            ),
          ],
        );
      },
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
              const CustomAppBar(text: 'Управление заказами', text1: ''),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _orders.length,
                  itemBuilder: (_, index) {
                    final order = _orders[index];
                    return Card(
                      color: Colors.white,
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: Image.asset('images/headphone.png'),
                        title: Text(order.customerName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Дата: ${order.orderDate}"),
                            Text("Сумма: ${order.amount.toStringAsFixed(2)} ₽"),
                            Text("Статус: ${order.status}"),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showOrderForm(order),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.button2Color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () => _showOrderForm(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
