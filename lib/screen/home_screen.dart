import 'package:flutter/material.dart';
import 'booking_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Repair Ghar")),
      body: ListView(
        children: [
          serviceTile(context, "AC Repair"),
          serviceTile(context, "Fan Repair"),
          serviceTile(context, "Cooler Repair"),
          serviceTile(context, "Electrician"),
        ],
      ),
    );
  }

  Widget serviceTile(BuildContext context, String service) {
    return ListTile(
      title: Text(service),
      trailing: const Icon(Icons.build),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingScreen(service: service),
          ),
        );
      },
    );
  }
}
