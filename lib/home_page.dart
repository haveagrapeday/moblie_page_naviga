import 'package:flutter/material.dart';
import 'topup_page.dart';
import 'balance_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Map<String, String>> history = [];

  double get currentBalance {
    return history.fold(0.0, (sum, item) => sum + (double.tryParse(item['amount'] ?? '0') ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9FA8DA),
                minimumSize: const Size(220, 60),
              ),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopupPage(currentBalance: currentBalance)),
                );
                if (result != null) setState(() => history.add(result));
              },
              child: const Text('เติมเงิน', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC5CAE9),
                minimumSize: const Size(220, 60),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BalancePage(history: history)),
              ),
              child: const Text('Balance/History', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}