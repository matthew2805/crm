import 'package:flutter/material.dart';
import 'package:salesmanagementapp/Constants/colors.dart';
import 'package:salesmanagementapp/Widgets/customapp_bar.dart';

class Customer {
  final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String region;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.region,
  });
}

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  CustomerListScreenState createState() => CustomerListScreenState();
}

class CustomerListScreenState extends State<CustomerListScreen> {
  final List<Customer> _customers = [
    Customer(
      id: 1,
      name: "Иванов Иван",
      email: "ivanov@example.com",
      phone: "+7 (900) 123-45-67",
      region: "Москва",
    ),
    Customer(
      id: 2,
      name: "Петрова Анна",
      email: "petrova@example.com",
      phone: "+7 (901) 234-56-78",
      region: "Санкт-Петербург",
    ),
    Customer(
      id: 3,
      name: "Сидоров Алексей",
      email: "sidorov@example.com",
      phone: "+7 (902) 345-67-89",
      region: "Новосибирск",
    ),
    Customer(
      id: 4,
      name: "Кузнецова Елена",
      email: "kuznetsova@example.com",
      phone: "+7 (903) 456-78-90",
      region: "Екатеринбург",
    ),
    Customer(
      id: 5,
      name: "Смирнов Дмитрий",
      email: "smirnov@example.com",
      phone: "+7 (904) 567-89-01",
      region: "Казань",
    ),
    Customer(
      id: 6,
      name: "Васильева Ольга",
      email: "vasileva@example.com",
      phone: "+7 (905) 678-90-12",
      region: "Нижний Новгород",
    ),
    Customer(
      id: 7,
      name: "Попов Артем",
      email: "popov@example.com",
      phone: "+7 (906) 789-01-23",
      region: "Самара",
    ),
    Customer(
      id: 8,
      name: "Лебедева Мария",
      email: "lebedeva@example.com",
      phone: "+7 (907) 890-12-34",
      region: "Омск",
    ),
    Customer(
      id: 9,
      name: "Козлов Андрей",
      email: "kozlov@example.com",
      phone: "+7 (908) 901-23-45",
      region: "Ростов-на-Дону",
    ),
    Customer(
      id: 10,
      name: "Новикова Татьяна",
      email: "novikova@example.com",
      phone: "+7 (909) 012-34-56",
      region: "Уфа",
    ),
    Customer(
      id: 11,
      name: "Морозов Сергей",
      email: "morozov@example.com",
      phone: "+7 (910) 123-45-67",
      region: "Красноярск",
    ),
    Customer(
      id: 12,
      name: "Волкова Ирина",
      email: "volkova@example.com",
      phone: "+7 (911) 234-56-78",
      region: "Пермь",
    ),
  ];

  void _showCustomerForm([Customer? customer]) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? name = customer?.name;
    String? email = customer?.email;
    String? phone = customer?.phone;
    String? region = customer?.region;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
              customer == null ? "Добавить клиента" : "Редактировать клиента"),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: name,
                  decoration: const InputDecoration(labelText: "ФИО"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Обязательное поле"
                      : null,
                  onSaved: (value) => name = value,
                ),
                TextFormField(
                  initialValue: email,
                  decoration: const InputDecoration(labelText: "Email"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Обязательное поле"
                      : null,
                  onSaved: (value) => email = value,
                ),
                TextFormField(
                  initialValue: phone,
                  decoration: const InputDecoration(labelText: "Телефон"),
                  onSaved: (value) => phone = value,
                ),
                TextFormField(
                  initialValue: region,
                  decoration: const InputDecoration(labelText: "Город"),
                  onSaved: (value) => region = value,
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
                    if (customer == null) {
                      _customers.add(Customer(
                        id: _customers.length + 1,
                        name: name!,
                        email: email!,
                        phone: phone!,
                        region: region!,
                      ));
                    } else {
                      customer.name = name!;
                      customer.email = email!;
                      customer.phone = phone!;
                      customer.region = region!;
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
              const CustomAppBar(text: 'Список клиентов', text1: ''),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _customers.length,
                  itemBuilder: (_, index) {
                    final customer = _customers[index];
                    return Card(
                      color: Colors.white,
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: Image.asset('images/c4.png'),
                        title: Text(customer.name),
                        subtitle: Text("${customer.region}, ${customer.phone}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showCustomerForm(customer),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () => _showCustomerForm(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
