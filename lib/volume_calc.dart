import 'package:flutter/material.dart';

class VolumeCalc extends StatefulWidget {
  const VolumeCalc({super.key});

  @override
  State<VolumeCalc> createState() => VolumeCalcState();
}

class VolumeCalcState extends State<VolumeCalc> {
  double _litter = 0;
  double _value = 3.785;
  double _gallon = 0;

  TextEditingController _litterCtrl = TextEditingController();
  TextEditingController _gallonCtrl = TextEditingController();

  void _calcVolume() {
    _litter = double.tryParse(_litterCtrl.text) ?? 0;

    setState(() {
      _gallon = _litter / _value;

      _gallonCtrl.text = _gallon.toStringAsFixed(2);
    });
  }

  // Reuse Styles
  final InputDecoration _textFieldStyle = InputDecoration(
    border: OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ปริมาตร"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        child: Column(
          children: [
            SizedBox(height: 10),

            Text(
              "ลิตร, $_litter ลิตร, แกลลอน ${_gallon.toStringAsFixed(2)} แกลลอน",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 10),

            TextField(
              controller: _litterCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(label: Text("ลิตร")),
            ),

            SizedBox(height: 10),

            TextField(
              controller: _gallonCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(label: Text("แกลลอน")),
              readOnly: true,
            ),

            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _calcVolume(),
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
