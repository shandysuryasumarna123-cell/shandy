import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const userName = 'Shandy';

    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    void showSnack(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: const Text(
          'Finance Mate 💰',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        elevation: 3,
      ),

      // ===== BODY =====
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: 80,
          ), // ruang bawah agar nav bar tidak ketutup
          child: Column(
            children: [
              // ===== HEADER =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6C63FF), Color(0xFF9A89FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/profile.png'),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai, $userName 👋',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'Selamat datang kembali!',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => showSnack('Notifikasi belum tersedia'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ===== Summary Cards =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _summaryCard(
                      icon: Icons.arrow_upward_rounded,
                      title: 'Income',
                      amount: 'Rp5.000.000',
                      color: Colors.greenAccent.shade400,
                    ),
                    _summaryCard(
                      icon: Icons.arrow_downward_rounded,
                      title: 'Expense',
                      amount: 'Rp270.000',
                      color: Colors.redAccent.shade200,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ===== My Cards =====
              _sectionTitle("My Cards"),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: const [
                    AtmCard(
                      bankName: 'Bank BCA',
                      cardNumber: '**** 2345',
                      balance: 'Rp12.500.000',
                      color1: Color(0xFF4A00E0),
                      color2: Color(0xFF8E2DE2),
                    ),
                    AtmCard(
                      bankName: 'Bank BRI',
                      cardNumber: '**** 8765',
                      balance: 'Rp5.350.000',
                      color1: Color(0xFFFF8008),
                      color2: Color(0xFFFFC837),
                    ),
                    AtmCard(
                      bankName: 'Bank BJB',
                      cardNumber: '**** 1122',
                      balance: 'Rp8.200.000',
                      color1: Color(0xFF00B09B),
                      color2: Color(0xFF96C93D),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== Quick Actions =====
              _sectionTitle("Quick Actions"),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ActionButton(
                      icon: Icons.add_card_rounded,
                      label: 'Top Up',
                      color: Colors.purpleAccent,
                      onPressed: () => showSnack('Top Up ditekan'),
                    ),
                    _ActionButton(
                      icon: Icons.send_rounded,
                      label: 'Transfer',
                      color: Colors.blueAccent,
                      onPressed: () => showSnack('Transfer ditekan'),
                    ),
                    _ActionButton(
                      icon: Icons.download_rounded,
                      label: 'Withdraw',
                      color: Colors.teal,
                      onPressed: () => showSnack('Withdraw ditekan'),
                    ),
                    _ActionButton(
                      icon: Icons.history_rounded,
                      label: 'History',
                      color: Colors.orangeAccent,
                      onPressed: () => showSnack('Lihat History'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ===== Categories (Smaller & Realistic Icons) =====
              _sectionTitle("Categories"),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 4, // tampil 4 per baris agar kecil & rapi
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _categoryCard(
                      Icons.favorite_rounded, // Health
                      'Health',
                      Colors.teal,
                      () => showSnack('Health clicked'),
                    ),
                    _categoryCard(
                      Icons.flight_takeoff_rounded, // Travel
                      'Travel',
                      Colors.indigoAccent,
                      () => showSnack('Travel clicked'),
                    ),
                    _categoryCard(
                      Icons.restaurant_menu_rounded, // Food
                      'Food',
                      Colors.orangeAccent,
                      () => showSnack('Food clicked'),
                    ),
                    _categoryCard(
                      Icons.event_available_rounded, // Event
                      'Event',
                      Colors.pinkAccent,
                      () => showSnack('Event clicked'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ===== Transactions =====
              _sectionTitle("Recent Transactions"),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionItem(transaction: transactions[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // ===== Bottom Navigation Bar =====
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF6C63FF),
        unselectedItemColor: Colors.grey,
        elevation: 10,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          switch (index) {
            case 0:
              showSnack('Home ditekan');
              break;
            case 1:
              showSnack('Dompet ditekan');
              break;
            case 2:
              showSnack('Insight ditekan');
              break;
            case 3:
              showSnack('Profile ditekan');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Dompet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_rounded),
            label: 'Insight',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF333333),
          ),
        ),
      ),
    );
  }
}

// ===== Summary Card =====
Widget _summaryCard({
  required IconData icon,
  required String title,
  required String amount,
  required Color color,
}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            amount,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}

// ===== Category Card (Smaller Version) =====
Widget _categoryCard(
  IconData icon,
  String label,
  Color color,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}

// ===== Quick Action Button =====
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(icon, color: color, size: 28),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
