import 'package:flutter/material.dart';

class loading_indicator extends StatelessWidget {
  const loading_indicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
              backgroundColor: Colors.white24,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Yükleniyor...',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
