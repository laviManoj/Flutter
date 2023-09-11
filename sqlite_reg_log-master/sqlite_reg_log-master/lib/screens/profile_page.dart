import 'package:flutter/material.dart';
import '../db/SQLHelper.dart';
class ProfilePage extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const ProfilePage({super.key, required this.data});
  void deleteUser(int id) async {
    await SQLHelper.Deleteuser(id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text('${data[index]['name']}'),
              Text('${data[index]['email']}'),
              Text('${data[index]['password']}'),
              // Rest of the code remains the same
            ],
          );
        },
      ),
    );
  }
}
