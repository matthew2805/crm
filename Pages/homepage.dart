import 'package:flutter/material.dart';
import 'package:salesmanagementapp/Constants/colors.dart';
import 'package:salesmanagementapp/Widgets/detailstext1.dart';
import 'package:salesmanagementapp/Widgets/drawer_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Главная панель',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Первый ряд карточек
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard(
                    bgcolor: const Color(0xffFFC727),
                    title: "Средний доход",
                    value: "\$18 460,00",
                    icon: Icons.trending_up,
                    color: Colors.pinkAccent,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildInfoCard(
                    bgcolor: const Color(0xff10B981),
                    title: "Средние расходы",
                    value: "\$4 320,00",
                    icon: Icons.trending_down,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),

            // Календарь
            const SizedBox(height: 16),
            const SizedBox(
              height: 50,
              width: double.infinity,
              child: Card(
                color: Color(0xff00B2EB),
                child: Center(
                    child: Text1(text1: 'Календарь', color: Colors.white)),
              ),
            ),

            // Секция "Ваши продукты"
            const SizedBox(height: 16),
            const Text(
              "Ваши продукты",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleIcon("Прибыль", Icons.attach_money),
                _buildCircleIcon("Продажи", Icons.shopping_cart),
                _buildCircleIcon("Посетители", Icons.person),
                _buildCircleIcon("Расходы", Icons.credit_card),
              ],
            ),

            // График
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Text(
                          [
                            'Янв',
                            'Фев',
                            'Мар',
                            'Апр',
                            'Май',
                            'Июн'
                          ][value.toInt()],
                          style: const TextStyle(fontSize: 12),
                        ),
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 3),
                        FlSpot(1, 4),
                        FlSpot(2, 2),
                        FlSpot(3, 5),
                        FlSpot(4, 3),
                        FlSpot(5, 4),
                      ],
                      isCurved: true,
                      color: const Color(0xffFFC727),
                      barWidth: 3,
                      belowBarData: BarAreaData(show: false),
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 6,
                ),
              ),
            ),

            // Секция "Статистика"
            const SizedBox(height: 16),
            const Text(
              "Статистика",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard("Заказы", "48 240"),
                _buildStatCard("Возвраты", "3 640"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Методы для построения элементов интерфейса
  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required Color bgcolor,
  }) {
    return Card(
      elevation: 1,
      color: bgcolor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.buttonColor,
                  child: Icon(icon, color: color),
                ),
                const Spacer(),
                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIcon(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.buttonColor,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
