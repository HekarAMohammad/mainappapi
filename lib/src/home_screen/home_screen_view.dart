import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome To University API ',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
            ),
            const Divider(
              color: Colors.indigo,
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/trainersScreen');
                },
                child: const Text('Show the Universities'))
          ],
        ),
      ),
    );
  }

  // String wait3Seconds(){
  //   // await Future.delayed(Duration(seconds: 3));
  //   return 'value recieved';
  // }
}
