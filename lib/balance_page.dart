import 'package:flutter/material.dart';

class BalancePage extends StatelessWidget {
  final List<Map<String, String>> history;
  const BalancePage({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
   
    double total = history.fold(0, (sum, item) => sum + (double.tryParse(item['amount'] ?? '0') ?? 0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('BalancePage'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                const Text(
                  'ยอดเงินคงเหลือ',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                
                const SizedBox(height: 8),

                Text(
                  '฿${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),


          const Divider(indent: 20, endIndent: 20), 
          
          
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                
                final item = history[history.length - 1 - index];

                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFE8F5E9), 
                    child: Icon(Icons.add, color: Colors.green), 
                  ),
                  title: Text(
                    'เติมเงิน ${item['amount']} บาท',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('${item['note']}'),
                 
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}