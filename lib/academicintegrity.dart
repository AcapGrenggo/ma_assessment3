import 'package:flutter/material.dart';

class AcademicIntegrityPage extends StatelessWidget {
  const AcademicIntegrityPage({super.key});

  Widget _buildInfoCard({
    required String title,
    required String content,
    Color? color,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color ?? Colors.indigo.shade800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color headerColor = Colors.indigo.shade800;
    const Color baseBg = Colors.white;

    return Scaffold(
      backgroundColor: baseBg,
      appBar: AppBar(
        backgroundColor: headerColor,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black45,
        title: const Text(
          "Academic Integrity",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // ICON HEADER
            Icon(
              Icons.school_outlined,
              size: 100,
              color: Colors.indigo.shade700,
            ),
            const SizedBox(height: 10),

            Text(
              "Academic Integrity in Smart Office Projects",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            _buildInfoCard(
              title: "1. Information About Myself!",
              content:
              "• NAME: ASYRAF EIMAN BIN MAZLAN\n"
                  "• ID NUMBER: DFI2401001\n"
                  "• EMAIL ADDRESS: romeoasyraf05@gmail.com\n"
                  "• PHONE NUMBER: 013-7672678\n",
            ),

            _buildInfoCard(
              title: "2. Why I Choose This Project?",
              content:
              "• To Build a Real-Time Security System in Office\n"
                  "• To Enhance Safety and Protection\n"
                  "• To Apply IoT Knowledge in a Practical Way\n"
                  "• To Develop a System Useful in the Real World",
            ),

            const SizedBox(height: 20),

            Text(
              "“Integrity is doing the right thing, even when no one is watching.”",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
