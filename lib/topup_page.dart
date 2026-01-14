import 'package:flutter/material.dart';
import 'report_page.dart';

class TopupPage extends StatefulWidget {
  final double currentBalance;
  const TopupPage({super.key, required this.currentBalance});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  
  void _onConfirm() async {
    double input = double.tryParse(_amountController.text) ?? 0;
    double newTotal = widget.currentBalance + input;

   
    final confirmData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportPage(
          amount: _amountController.text,
          note: _noteController.text,
          newBalance: newTotal,
        ),
      ),
    );

    
    if (!mounted) return;

   
    if (confirmData != null) {
      Navigator.pop(context, confirmData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top up'),
        automaticallyImplyLeading: false, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'จำนวนเงิน', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(labelText: 'Note:', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('ยกเลิก'),
                ),
               
                ElevatedButton(
                  onPressed: _onConfirm,
                  child: const Text('ยืนยัน'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}