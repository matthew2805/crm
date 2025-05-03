import 'package:flutter/material.dart';
import 'package:salesmanagementapp/Widgets/customapp_bar.dart';



class SalesHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> salesHistory = [
    {
      "title": "Application for Patient",
      "status": "Private",
      "daysLeft": "3 days left",
      "progress": 78,
      "avatars": ["images/c2.png", "images/c3.png"],
    },
    {
      "title": "Health App for...",
      "status": "Private",
      "daysLeft": "3 days left",
      "progress": 20,
      "avatars": ["images/c4.png", "images/c5.png"],
    },
    {
      "title": "Epay Wallet App UI Kit",
      "status": "Public",
      "daysLeft": "11 days left",
      "progress": 89,
      "avatars": ["images/c2.png", "images/c3.png"],
    },{
      "title": "Application for Patient",
      "status": "Private",
      "daysLeft": "3 days left",
      "progress": 78,
      "avatars": ["images/c2.png", "images/c3.png"],
    },
    {
      "title": "Health App for...",
      "status": "Private",
      "daysLeft": "3 days left",
      "progress": 20,
      "avatars": ["images/c4.png", "images/c5.png"],
    },
    {
      "title": "Epay Wallet App UI Kit",
      "status": "Public",
      "daysLeft": "11 days left",
      "progress": 89,
      "avatars": ["images/c2.png", "images/c3.png"],
    },{
      "title": "Application for Patient",
      "status": "Private",
      "daysLeft": "3 days left",
      "progress": 78,
      "avatars": ["images/c2.png", "images/c3.png"],
    },
    {
      "title": "Health App for...",
      "status": "Private",
      "daysLeft": "3 days left",
      "progress": 20,
      "avatars": ["images/c4.png", "images/c5.png"],
    },
    {
      "title": "Epay Wallet App UI Kit",
      "status": "Public",
      "daysLeft": "11 days left",
      "progress": 89,
      "avatars": ["images/c2.png", "images/c3.png"],
    },{
      "title": "Application for Patient",
      "status": "Private",
      "daysLeft": "3 days left",
      "progress": 78,
      "avatars": ["images/c2.png", "images/c3.png"],
    },
    {
      "title": "Health App for...",
      "status": "Private",
      "daysLeft": "3 days left",
      "progress": 20,
      "avatars": ["images/c4.png", "images/c5.png"],
    },
    {
      "title": "Epay Wallet App UI Kit",
      "status": "Public",
      "daysLeft": "11 days left",
      "progress": 89,
      "avatars": ["images/c2.png", "images/c3.png"],
    },
  ];

   SalesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          const SizedBox(height: 30,),
          const Padding(
            padding: EdgeInsets.all(13.0),
            child: CustomAppBar(text: 'Sales History', text1: ''),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(13),
              itemCount: salesHistory.length,
              itemBuilder: (context, index) {
                final item = salesHistory[index];
                return Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        item['status'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: item['status'] == "Public"
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        item['daysLeft'],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: item['avatars'].map<Widget>((avatar) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundImage: AssetImage(avatar),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              children: [
                                Text(
                                  "${item['progress']}%",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                SizedBox(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: item['progress'] / 100,
                                    color: Colors.green,
                                    backgroundColor: Colors.grey[300],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 24, thickness: 1),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
