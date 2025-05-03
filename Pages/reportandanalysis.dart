import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class ReportsAndAnalyticsScreen extends StatefulWidget {
  const ReportsAndAnalyticsScreen({super.key});

  @override
  ReportsAndAnalyticsScreenState createState() =>
      ReportsAndAnalyticsScreenState();
}

class ReportsAndAnalyticsScreenState extends State<ReportsAndAnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Пример данных
  final List<Map<String, dynamic>> salesData = [
    {"product": "Продукт A", "region": "Север", "rep": "Иван", "sales": 1500},
    {"product": "Продукт B", "region": "Юг", "rep": "Анна", "sales": 2000},
    {"product": "Продукт C", "region": "Запад", "rep": "Борис", "sales": 1200},
    // ... остальные элементы
  ];

  final List<Map<String, dynamic>> performanceData = [
    {"team": "Команда Альфа", "individual": "Иван", "score": 85},
    {"team": "Команда Бета", "individual": "Анна", "score": 90},
    {"team": "Команда Гамма", "individual": "Борис", "score": 70},
    // ... остальные элементы
  ];

  final Map<String, double> revenueData = {
    "Продукт A": 5000,
    "Продукт B": 3000,
    "Продукт C": 2000,
    // ... остальные элементы
  };

  final List<Map<String, dynamic>> liveData = [
    {"time": "10:00", "sales": 500},
    {"time": "11:00", "sales": 800},
    // ... остальные элементы
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void refreshLiveData() {
    setState(() {
      liveData.add({"time": "12:00", "sales": 600});
    });
  }

  Future<void> exportToPDF() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text("Отчет о продажах"),
        ),
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/report.pdf");
    await file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Отчеты и аналитика"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Продажи"),
            Tab(text: "Производительность"),
            Tab(text: "Доходы"),
            Tab(text: "Время продажи"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: exportToPDF,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Отчеты о продажах
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: salesData.length,
            itemBuilder: (context, index) {
              final data = salesData[index];
              return Card(
                color: Colors.white,
                elevation: 1,
                child: ListTile(
                  leading: Image.asset('images/c3.png'),
                  title: Text("${data['product']} - ${data['region']}"),
                  subtitle: Text("Представитель: ${data['rep']}"),
                  trailing: Text("${data['sales']} ₽"),
                ),
              );
            },
          ),

          // Анализ производительности
          // В разделе Performance Insights (Анализ производительности)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: BarChart(
                BarChartData(
                  barGroups: performanceData
                      .asMap()
                      .entries
                      .map((entry) => BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                fromY: 0,
                                toY: entry.value['score'].toDouble(),
                                color: Colors.blue,
                              ),
                            ],
                          ))
                      .toList(),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text('${value.toInt()}%',
                              style: const TextStyle(fontSize: 10));
                        },
                        interval: 20, // Шаг между подписями
                        reservedSize: 30, // Место для подписей
                      ),
                    ),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
          ),

          // Анализ доходов
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: PieChart(
                PieChartData(
                  titleSunbeamLayout: true,
                  sectionsSpace: 10,
                  sections: revenueData.entries
                      .map(
                        (entry) => PieChartSectionData(
                          showTitle: true,
                          title: entry.key,
                          value: entry.value,
                          color: Colors.primaries[
                              revenueData.keys.toList().indexOf(entry.key)],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),

          // Онлайн отчеты
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: liveData.length,
            itemBuilder: (context, index) {
              final data = liveData[index];
              return Card(
                color: Colors.white,
                elevation: 1,
                child: ListTile(
                  title: Text("Время: ${data['time']}"),
                  trailing: Text("Продажи: ${data['sales']} ₽"),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: _tabController.index == 3
          ? FloatingActionButton(
              onPressed: refreshLiveData,
              child: const Icon(Icons.refresh),
            )
          : null,
    );
  }
}
