import 'package:flutter/material.dart';
import 'package:salesmanagementapp/Widgets/customapp_bar.dart';

import '../../../Widgets/detailstext1.dart';

class TotalSalesScreen extends StatelessWidget {
  const TotalSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(text: 'Total Sales', text1: ''),

            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildCard(
                  color: Colors.amber[100]!,
                  value: "₹ 42,698",
                  subtitle: "Monthly Revenue",
                  iconColor: Colors.amber,
                ),
                _buildCard(
                  color: Colors.green[100]!,
                  value: "250",
                  subtitle: "Monthly Registrations",
                  iconColor: Colors.green,
                ),
                _buildCard(
                  color: Colors.orange[100]!,
                  value: "₹ 2,698",
                  subtitle: "Weekly Revenue",
                  iconColor: Colors.orange,
                ),
                _buildCard(
                  color: Colors.teal[100]!,
                  value: "12",
                  subtitle: "Weekly Registrations",
                  iconColor: Colors.teal,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(
              height: 50,
              width: double.infinity,
              child: Card(
                color: Color(0xff00B2EB),
                child: Center(child: Text1(text1: 'Track Team',color: Colors.white,),),
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              "Targets",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,

              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildCard(
                  color: Colors.amber[200]!,
                  value: "₹ 50,000",
                  subtitle: "Monthly Revenue",
                  iconColor: Colors.grey,
                ),
                _buildCard(
                  color: Colors.blue[100]!,
                  value: "300",
                  subtitle: "Monthly Registrations",
                  iconColor: Colors.blue,
                ),
                _buildCard(
                  color: Colors.deepPurple[100]!,
                  value: "₹ 12,000",
                  subtitle: "Weekly Revenue",
                  iconColor: Colors.deepPurple,
                ),
                _buildCard(
                  color: Colors.blueGrey[100]!,
                  value: "75",
                  subtitle: "Weekly Registrations",
                  iconColor: Colors.blueGrey,
                ),
              ],
            ),
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildCard(
                  color: Colors.amber[100]!,
                  value: "₹ 42,698",
                  subtitle: "Monthly Revenue",
                  iconColor: Colors.amber,
                ),
                _buildCard(
                  color: Colors.green[100]!,
                  value: "250",
                  subtitle: "Monthly Registrations",
                  iconColor: Colors.green,
                ),
                _buildCard(
                  color: Colors.orange[100]!,
                  value: "₹ 2,698",
                  subtitle: "Weekly Revenue",
                  iconColor: Colors.orange,
                ),
                _buildCard(
                  color: Colors.teal[100]!,
                  value: "12",
                  subtitle: "Weekly Registrations",
                  iconColor: Colors.teal,
                ),
              ],
            ),

            const SizedBox(height: 24),
            // Example for recent activity or other elements
            _buildActivityTile(
              title: "98725 98725",
              dateTime: "12 July 2022 - 16:24",
              status: "0",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required Color color,
    required String value,
    required String subtitle,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Icon(Icons.pie_chart, color: iconColor),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTile({
    required String title,
    required String dateTime,
    required String status,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(dateTime),
      trailing: Text(
        status,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
