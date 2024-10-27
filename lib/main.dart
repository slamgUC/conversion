import 'package:flutter/material.dart';

void main() {
  runApp(ConversionApp());
}

class ConversionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Conversion App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ConversionScreen(),
    );
  }
}

class ConversionScreen extends StatefulWidget {
  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  final TextEditingController _controller = TextEditingController();
  String _selectedConversion = 'Miles to Kilometers';
  double _result = 0.0;

  void _convert() {
    double inputValue = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      switch (_selectedConversion) {
        case 'Miles to Kilometers':
          _result = inputValue * 1.60934;
          break;
        case 'Kilometers to Miles':
          _result = inputValue / 1.60934;
          break;
        case 'Kilograms to Pounds':
          _result = inputValue * 2.20462;
          break;
        case 'Pounds to Kilograms':
          _result = inputValue / 2.20462;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Value',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedConversion,
              items: <String>[
                'Miles to Kilometers',
                'Kilometers to Miles',
                'Kilograms to Pounds',
                'Pounds to Kilograms'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedConversion = newValue!;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 16),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
