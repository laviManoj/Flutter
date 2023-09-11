import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../db/SQLHelper.dart';
class AdminHome extends StatefulWidget {
const AdminHome({Key? key}) : super(key: key);
  @override
  State<AdminHome> createState() => _AdminHomeState();
}
class _AdminHomeState extends State<AdminHome> {
  List<Map<String, dynamic>> data = [];
  void deleteUser(int id) async {
    await SQLHelper.Deleteuser(id);
    refreshData();
  }
  void refreshData() async {
    dynamic myData = await SQLHelper.getAll();
    if (myData is List<Map<String, dynamic>>) {
      setState(() {
        data = myData;
      });
    } else {
      // Handle the case where the data is not of the expected type
      if (kDebugMode) {
        print("Data is not of the expected type");
      }
    }
  }
  @override
  void initState() {
    refreshData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.deepPurple[200],
            child: ListTile(
              title: Text('${data[index]['name']}'),
              trailing: IconButton(
                onPressed: () {
                  deleteUser(data[index]['id']);
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
