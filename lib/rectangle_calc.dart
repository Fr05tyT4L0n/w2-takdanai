import 'package:flutter/material.dart';

class RectangleCalc extends StatefulWidget {
  const RectangleCalc({super.key});

  @override
  State<RectangleCalc> createState() => RectangleCalcState();
}

class RectangleCalcState extends State<RectangleCalc> {
  int _width = 0;
  int _length = 0;
  int _area = 0;

  TextEditingController _widthCtrl = TextEditingController();
  TextEditingController _lengthCtrl = TextEditingController();

  void _calcRectangle() {
    _width = int.tryParse(_widthCtrl.text) ?? 0;
    _length = int.tryParse(_lengthCtrl.text) ?? 0;

    setState(() {
      _area = _width * _length;
    });
  }

  // Reuse Styles
  final InputDecoration _textFieldStyle = InputDecoration(
    border: OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("พื้นที่สี่เหลี่ยม"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        child: Column(
          children: [
            SizedBox(height: 10),

            Text(
              "กว้าง $_width เมตร, ยาว $_length เมตร, พื้นที่ $_area ตารางเมตร",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),

            SizedBox(height: 10),

            TextField(
              controller: _widthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(label: Text("ความกว้าง")),
            ),

            SizedBox(height: 10),

            TextField(
              controller: _lengthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(label: Text("ความยาว")),
            ),

            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () => _calcRectangle(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "คำนวณ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
