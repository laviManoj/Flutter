// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DataFetchingScreen extends StatefulWidget {
const DataFetchingScreen({super.key});
 @override
 _DataFetchingScreenState createState() => _DataFetchingScreenState();
}
class _DataFetchingScreenState extends State<DataFetchingScreen> {
 List<dynamic> data = []; // Placeholder for fetched data

  Future<void> fetchData() async {
   final response = await http.get(Uri.parse('https://api.example.com/data'));
   if (response.statusCode == 200) {
      setState(() {
       data = jsonDecode(response.body);
      });
    } else {
      // Handle errors
    }
  }
 @override
 void initState() {
   super.initState();
   fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Fetching Example'),
      ),
      body: Center(
        child: data.isEmpty
            ? const CircularProgressIndicator() // Display a loading indicator
            : ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index]['title']),
              subtitle: Text(data[index]['description']),
            );
          },
        ),
      ),
    );
  }
}
void main() {
  runApp(const MaterialApp(
    home: DataFetchingScreen(),
  ));
}
