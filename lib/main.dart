import 'package:apiproject/data_service.dart';
import 'package:apiproject/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyCode());
}

class MyCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _dataService = DataService();
  WeatherResponse? response;
  TextEditingController controller = TextEditingController();
  double degreevalue =0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Current weather'),
      ),
      body: Column(
        children: [
          response != null
              ? Text(degreevalue.toString())
              : Container(),
          TextField(
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () {
                _search();
              },
              child: Text('Get'))
        ],
      ),
    );
  }

  void _search() async {
    final response1 = await _dataService.getWeather(controller.text);
    setState(() {
      response = response1;
      final temp = response!.tempInfo.temperature;
      degreevalue = (temp-32)*0.555;
    });
  }
}
