import 'package:flutter/material.dart';

// Components
import 'rectangle_calc.dart';
import 'volume_calc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/RectangleCalc': (context) => RectangleCalc(),
        '/VolumeCalc': (context) => VolumeCalc(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 15),
            Text("โปรแกรมคำนวณ", style: TextStyle(fontSize: 24)),
            SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: TextButton(
                onPressed: () => {
                  Navigator.pushNamed(context, '/RectangleCalc'),
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text("คำนวณพื้นที่สี่เหลี่ยม"),
              ),
            ),
            
            SizedBox(
              width: double.infinity,

              child: TextButton(
                onPressed: () => {
                  Navigator.pushNamed(context, '/VolumeCalc'),
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text("แปลงลิตรเป็นแกลลอน"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
