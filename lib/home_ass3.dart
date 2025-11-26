import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard_page.dart';
import 'actuator_page.dart';
import 'academicintegrity.dart';
import 'signin.dart';

class HomePage3 extends StatelessWidget {
  const HomePage3({super.key});

  Widget _buildStyledButton(
      BuildContext context, {
        required String text,
        required IconData icon,
        required VoidCallback onPressed,
        required Color buttonColor,
      }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 30, color: buttonColor),
                    const SizedBox(width: 15),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey.shade800,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.indigo.shade700;
    const Color baseBg = Colors.white;
    final Color gradientEndColor = Colors.lightBlue.shade50;
    final Color headerColor = Colors.indigo.shade800;

    return Scaffold(
      backgroundColor: baseBg,
      appBar: AppBar(
        backgroundColor: headerColor,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black45,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          "Smart Office PJ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Log Out",
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                      (route) => false
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [baseBg, gradientEndColor, baseBg],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_tree_outlined,
                    size: 110,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Automation Controller",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Smart Office IOT",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.indigo.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 60),

                  _buildStyledButton(
                    context,
                    text: "Real-time Dashboard",
                    icon: Icons.monitor_heart,
                    buttonColor: Colors.teal.shade500,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DashboardPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 25),

                  _buildStyledButton(
                    context,
                    text: "Actuator Controls",
                    icon: Icons.tune,
                    buttonColor: Colors.orange.shade600,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ActuatorPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 25),

                  _buildStyledButton(
                    context,
                    text: "Academic Integrity",
                    icon: Icons.school_outlined,
                    buttonColor: Colors.indigo.shade600,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AcademicIntegrityPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 40),

                  Text(
                    "Made by Asyraf Mazlan",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
