import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  final String amount;
  final String note;
  final double newBalance;

  const ReportPage({
    super.key, 
    required this.amount, 
    required this.note, 
    required this.newBalance
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top up report'), automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 80, color: Colors.green),
            const SizedBox(height: 10),
            const Text('เติมเงินเรียบร้อย', style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 52, 52, 52))),
            
            //add
            Text('$amount บาท', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            
            // Balance
            Text(
              'Balance ${newBalance.toStringAsFixed(2)} บาท', 
              style: TextStyle(fontSize: 18, color: Colors.indigo[700], fontWeight: FontWeight.w500)
            ),
            
            const SizedBox(height: 10),
            if (note.isNotEmpty) Text('Note: $note', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              onPressed: () {
                Navigator.pop(context, {
                  "amount": amount,
                  "note": note,
                  "date": "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"
                });
              },
              child: const Text('กลับสู่หน้าหลัก', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}