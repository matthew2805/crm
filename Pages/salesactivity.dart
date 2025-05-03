import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:salesmanagementapp/Widgets/customapp_bar.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  ActivitiesScreenState createState() => ActivitiesScreenState();
}

class ActivitiesScreenState extends State<ActivitiesScreen> {
  List<Color> gradientColors = [
    const Color(0xFF23b6e6),
    const Color(0xFF0288d1),
  ];

  List<FlSpot> spots = [
    const FlSpot(0, 12),
    const FlSpot(1, 15),
    const FlSpot(2, 10),
    const FlSpot(3, 20),
    const FlSpot(4, 18),
    const FlSpot(5, 10),
    const FlSpot(6, 14),
  ];

  List<FlSpot> spots2 = [
    const FlSpot(0, 10),
    const FlSpot(1, 12),
    const FlSpot(2, 15),
    const FlSpot(3, 13),
    const FlSpot(4, 16),
    const FlSpot(5, 11),
    const FlSpot(6, 16),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: <Widget>[
              const CustomAppBar(text: 'Sales Activities', text1: ''),
              const SizedBox(height: 15,),
              
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Conversion")),
                  const Spacer(),
                  const Text("Visitors"),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Activities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: LineChart(
                  LineChartData(
                    lineTouchData: const LineTouchData(enabled: false),
                    gridData: const FlGridData(show: true),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        axisNameWidget: const Text('Days'), // Set the title of the axis if needed
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 22,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 0:
                                return const Text('S');
                              case 1:
                                return const Text('M');
                              case 2:
                                return const Text('T');
                              case 3:
                                return const Text('W');
                              case 4:
                                return const Text('T');
                              case 5:
                                return const Text('F');
                              case 6:
                                return const Text('S');
                              default:
                                return const Text('');
                            }
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        axisNameWidget: const Text('Activity Level'),
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) return const Text('0k');
                            if (value == 10) return const Text('10k');
                            if (value == 15) return const Text('15k');
                            return const Text('');
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 20,
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Colors.red,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                      ),
                      LineChartBarData(
                        spots: spots2,
                        isCurved: true,
                        color: Colors.white,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Sales'),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              transactionCard("Order #4870", "Thu 8 Apr, 2021", "\$80.00", Icons.pie_chart),
              const SizedBox(height: 6),
              transactionCard("Return #3248", "Fri 12 Apr, 2021", "\$72.00", Icons.swap_horiz),
              const SizedBox(height: 6),
              transactionCard("Order #4870", "Thu 8 Apr, 2021", "\$80.00", Icons.pie_chart),
              const SizedBox(height: 6),
              transactionCard("Return #3248", "Fri 12 Apr, 2021", "\$72.00", Icons.swap_horiz),
              const SizedBox(height: 6),
              transactionCard("Order #4870", "Thu 8 Apr, 2021", "\$80.00", Icons.pie_chart),
              const SizedBox(height: 6),
              transactionCard("Return #3248", "Fri 12 Apr, 2021", "\$72.00", Icons.swap_horiz),
            ],
          ),
        ),
      ),
    );
  }

  Widget transactionCard(String title, String date, String amount, IconData icon) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(icon, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(date, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
