import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:salesmanagementapp/Widgets/customapp_bar.dart';

class SalesReportScreen extends StatefulWidget {
  const SalesReportScreen({super.key});

  @override
  SalesReportScreenState createState() => SalesReportScreenState();
}

class SalesReportScreenState extends State<SalesReportScreen> {
  List<BarChartGroupData> rawBarGroups = [];
  List<String> days = ['27 окт', '28 окт', '29 окт', '30 окт', '31 окт'];
  List<double> salesData = [2000, 3000, 3800, 3000, 2200];
  String selectedViewPeriod = 'Эта неделя';
  final Map<String, List<Map<String, dynamic>>> productViews = {
    'Эта неделя': [
      {'productName': 'Наушники', 'views': 120},
      {'productName': 'Колонки', 'views': 90},
      {'productName': 'Микрофоны', 'views': 75},
    ],
    'Этот месяц': [
      {'productName': 'Наушники', 'views': 450},
      {'productName': 'Колонки', 'views': 380},
      {'productName': 'Микрофоны', 'views': 310},
    ],
    'Этот год': [
      {'productName': 'Наушники', 'views': 5200},
      {'productName': 'Колонки', 'views': 4300},
      {'productName': 'Микрофоны', 'views': 3900},
    ],
  };

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData() {
    rawBarGroups = List.generate(days.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: salesData[index].toDouble(),
            color: Colors.teal,
            width: 20,
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 3),
              child: CustomAppBar(text: 'Отчет по продажам', text1: ''),
            ),
            AspectRatio(
              aspectRatio: 1.7,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final index = value.toInt();
                          if (index >= 0 && index < days.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                days[index],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
                        interval: 1000,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          if (value % 1000 == 0) {
                            return Text(
                              '${value.toInt() ~/ 1000}к',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: rawBarGroups,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 1000,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(color: Colors.grey[200]!, strokeWidth: 1);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Категории',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                categoryCard(
                    context, Icons.account_balance, 'Инвестиции', '450,12 ₽'),
                const SizedBox(width: 10),
                categoryCard(
                    context, Icons.shopping_cart, 'Продажи', '261,99 ₽'),
                const SizedBox(width: 10),
                categoryCard(context, Icons.stars, 'Подписки', '127,95 ₽'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Просмотры товаров',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              value: selectedViewPeriod,
              items: productViews.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedViewPeriod = value!;
                });
              },
            ),
            const SizedBox(height: 10),
            ...productViews[selectedViewPeriod]!.map((product) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.white,
                child: ListTile(
                  leading: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      'images/headphone.png',
                      scale: 3,
                    ),
                  ),
                  title: Text(product['productName']),
                  trailing: Text(
                    '${product['views']} просмотров',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget categoryCard(
      BuildContext context, IconData icon, String title, String value) {
    return Expanded(
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: <Widget>[
              Icon(icon, size: 30, color: Colors.teal),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
