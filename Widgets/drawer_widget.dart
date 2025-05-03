import 'package:flutter/material.dart';
import 'package:salesmanagementapp/Pages/CustomersManagement/customersmanagement.dart';
import 'package:salesmanagementapp/Pages/Home/homepage.dart';
import 'package:salesmanagementapp/Pages/LeadManagement/leadmanagement.dart';
import 'package:salesmanagementapp/Pages/OrderManagement/ordermanagement.dart';
import 'package:salesmanagementapp/Pages/PaymentAndInvoices/paymentandinvoices.dart';
import 'package:salesmanagementapp/Pages/Products/products.dart';
import 'package:salesmanagementapp/Pages/ReportandAnalysis/reportandanalysis.dart';
import 'package:salesmanagementapp/Pages/SalesPipeline/salespipelines.dart';
import 'package:salesmanagementapp/Pages/TaskManagement/taskmanagement.dart';
import 'package:salesmanagementapp/Pages/TeamMembers/teammemebers.dart';
import 'package:salesmanagementapp/Pages/TotalSales/totalsales.dart';
import 'package:salesmanagementapp/Pages/Transactions/transactions.dart';
import '../Pages/ChatFlow/chat_screen.dart';
import '../Pages/Reviews/reviews.dart';
import '../Pages/SalesActivity/salesactivity.dart';
import '../Pages/SalesHistory/saleshistory.dart';
import '../Pages/SalesReport/salesreport.dart';
import '../Pages/Settings/settings_screen.dart';
import 'detailstext1.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String _selectedMenuItem = 'Главная'; // Обновленное значение по умолчанию

  // Обновленный список пунктов меню на русском
  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Главная', 'icon': Icons.home, 'page': const HomeScreen()},
    {
      'title': 'Общие продажи',
      'icon': Icons.attach_money,
      'page': const TotalSalesScreen()
    },
    {
      'title': 'Клиенты',
      'icon': Icons.people,
      'page': const CustomerListScreen()
    },
    {
      'title': 'Управление заказами',
      'icon': Icons.shopping_basket,
      'page': const OrderManagementScreen()
    },
    {
      'title': 'Платежи и счета',
      'icon': Icons.receipt_long,
      'page': const PaymentsInvoicingScreen()
    },
    {'title': 'Товары', 'icon': Icons.inventory, 'page': ProductsScreen()},
    {
      'title': 'Отчеты и аналитика',
      'icon': Icons.bar_chart,
      'page': const ReportsAndAnalyticsScreen()
    },
    {
      'title': 'Активность продаж',
      'icon': Icons.list_alt_outlined,
      'page': const ActivitiesScreen()
    },
    {
      'title': 'История продаж',
      'icon': Icons.history,
      'page': SalesHistoryScreen()
    },
    {
      'title': 'Воронка продаж',
      'icon': Icons.timeline,
      'page': const SalesPipelineScreen()
    },
    {
      'title': 'Отчеты по продажам',
      'icon': Icons.picture_as_pdf,
      'page': const SalesReportScreen()
    },
    {
      'title': 'Управление задачами',
      'icon': Icons.check_circle_outline,
      'page': const TaskListScreen()
    },
    {
      'title': 'Транзакции',
      'icon': Icons.account_balance_wallet,
      'page': TransactionScreen()
    },
    {
      'title': 'Сообщения',
      'icon': Icons.message_outlined,
      'page': const ChatScreen()
    },
    {
      'title': 'Отзывы',
      'icon': Icons.rate_review_outlined,
      'page': const Reviews()
    },
    {
      'title': 'Настройки',
      'icon': Icons.settings_outlined,
      'page': const SettingsScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 60),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(2, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 20, right: 5, top: 10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _buildUserHeader(),
          const SizedBox(height: 20),

          // Пункты меню
          ..._menuItems.map((item) => _buildMenuItem(
                title: item['title'],
                icon: item['icon'],
                isSelected: _selectedMenuItem == item['title'],
                onTap: () {
                  setState(() => _selectedMenuItem = item['title']);
                  _navigateTo(item['page']);
                },
              )),

          const Divider(thickness: 1, height: 30),
          _buildLogoutButton(),
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset('images/c2.png',
            width: 50, height: 50, fit: BoxFit.cover),
      ),
      title:
          const Text('Продавец', style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: const Text1(text1: 'matthewww'),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.2) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(icon, color: isSelected ? Colors.blue : Colors.grey[700]),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, size: 18),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogoutButton() {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: const Text(
        'Выход', // Обновленная надпись
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {
        // Логика выхода
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Выход из системы...')),
        );
      },
    );
  }

  void _navigateTo(Widget page) {
    Navigator.of(context).pop();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }
}
