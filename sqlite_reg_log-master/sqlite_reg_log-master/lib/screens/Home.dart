import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "profile_page.dart" show ProfilePage;
class Home extends StatelessWidget {
 final dynamic data; // Change 'dynamic' to a specific data type if possible
  const Home({Key? key, required this.data}) : super(key: key);
  Future<List<Map<String, dynamic>>> getData() async {
    var urlString = "https://fakestoreapi.com/products?limit=5";
    var url = Uri.parse(urlString);
    var response = await http.get(url);
    List<Map<String, dynamic>> data = jsonDecode(response.body);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    var name = data[0]['name'];
    var email = data[0]['email'];
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("$name"),
              accountEmail: Text("$email"),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(data: data),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome $name"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<Map<String, dynamic>> data = snapshot.data;

            return Center(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, index) {
                  var singleData = data[index];

                  return Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // ... (Other parts of the UI)

                        Text(
                          singleData["description"].toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
