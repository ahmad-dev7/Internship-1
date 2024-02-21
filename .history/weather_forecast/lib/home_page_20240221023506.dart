import 'package:flutter/material.dart';
import 'package:weather_forecast/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String temp = '';
  @override
  void initState() {
    getTemp();
    super.initState();
  }

  getTemp() async {
    temp = await getWeather();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather forecast'),
      ),
      body: Center(
        child: Visibility(
            visible: temp.isNotEmpty,
            replacement: const CircularProgressIndicator(),
            child: ListTile(
              title: const Text('Current Temperature is displayed below'),
              subtitle: Text(temp),
              leading: const Icon(Icons.airplane_ticket),
              trailing: const Icon(Icons.one_k_sharp),
            )
            // Text(
            //   temp.toString(),
            //   style: const TextStyle(fontSize: 25),
            // ),
            ),
      ),
    );
  }
}
