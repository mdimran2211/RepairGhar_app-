import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _selectedRole;

  void _saveProfile() {
    if (_selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a role")),
      );
      return;
    }

    // Here you can save the profile info to Firebase Firestore or Realtime Database

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile saved as $_selectedRole")),
    );

    // Navigate to home or dashboard screen here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complete Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${widget.name}"),
            Text("Email: ${widget.email}"),
            Text("Phone: ${widget.phone}"),
            const SizedBox(height: 20),
            const Text(
              "Select your role:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: const Text("Customer"),
              value: "Customer",
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Repair Worker"),
              value: "Repair Worker",
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveProfile,
                child: const Text("Save Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}