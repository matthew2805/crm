import 'package:flutter/material.dart';

class SalesPipelineScreen extends StatefulWidget {
  const SalesPipelineScreen({super.key});

  @override
  SalesPipelineScreenState createState() => SalesPipelineScreenState();
}

class SalesPipelineScreenState extends State<SalesPipelineScreen> {
  final Map<String, List<Map<String, String>>> pipelineStages = {
    "Leads": [
      {"name": "Client A", "details": "Looking for CRM solutions"},
      {"name": "Client B", "details": "Requested product demo"},
    ],
    "Negotiation": [
      {"name": "Client C", "details": "Negotiating pricing"},
    ],
    "Proposal Sent": [
      {"name": "Client D", "details": "Proposal sent for \$10,000"},
      {"name": "Client E", "details": "Awaiting feedback on proposal"},
    ],
    "Won": [
      {"name": "Client F", "details": "Closed deal for \$25,000"},
    ],
  };

  void _showAddOpportunityModal() {
    // Add modal logic here if required in the future
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Feature Under Development"),
        content: const Text("Adding new opportunities will be available soon."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Pipeline"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: pipelineStages.entries.map((stage) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stage.key,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: stage.value.length,
                  itemBuilder: (context, index) {
                    final opportunity = stage.value[index];
                    return Card(
                      color: Colors.white,
                      elevation: 1,
                      child: ListTile(
                        title: Text(opportunity["name"] ?? ""),
                        subtitle: Text(opportunity["details"] ?? ""),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddOpportunityModal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
