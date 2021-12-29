import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../temp/students_mock_data.dart';

class TrainersScreenView extends StatelessWidget {
  const TrainersScreenView({Key? key, this.userName, this.password})
      : super(key: key);
  final String? userName;
  final String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: getUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              //  todo: show a loading widget
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // show an error
              return Text(snapshot.error.toString());
            } else {
              //show the data
              return ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        const Text(
                          ('Name Of the University : '),
                        ),
                        Text(
                          snapshot.data![index],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),

      // ListView.builder(
      //   itemCount: studentMockList.length,
      //   itemBuilder: (context, index) {
      //     return _theStudentsCard(index);
      //   },
      // ),
    );
  }

  Future<List<dynamic>> getUsers() async {
    //the end point url
    String theUrl =
        "http://universities.hipolabs.com/search?country=United+States";

    // wait and revieve a response from the endpoint
    http.Response response = await http.get(Uri.parse(theUrl));

    // decode the json body to a list<dynamic>
    List decodedJson = jsonDecode(response.body);

    // return a list of strings from the list<dynamic> we had
    return decodedJson
        .map(
          (e) => e["name"],
        )
        .toList();
  }

  Widget _theStudentsCard(int index) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      // decoration: BoxDecoration(
      //   color: Colors.grey[500],
      // ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 5),
              height: 150,
              width: 150,
              child: Image.network(studentMockList[index].imgUrl ??
                  'https://bondprinting.com/wp-content/uploads/2019/03/placeholder-face-big.png')),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 150,
                      width: 90,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(studentMockList[index].name ?? 'no name',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(fontSize: 18)),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            studentMockList[index].points.toString(),
                          ),
                        ),
                        const Divider(
                          height: 8,
                        ),
                        const Text('points'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
