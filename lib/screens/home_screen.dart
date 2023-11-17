
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/global_controller.dart';
import 'package:weatherapp/utils/custom_colors.dart';
import 'package:weatherapp/widgets/comfort_level.dart';
import 'package:weatherapp/widgets/current_weather.dart';
import 'package:weatherapp/widgets/daily_data_forecast.dart';
import 'package:weatherapp/widgets/header_widget.dart';
import 'package:weatherapp/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  static const double sizedBoxHeight = 10.0;

  @override
  Widget build(BuildContext context) {
    final btnMapa = FloatingActionButton.extended(
      icon: const Icon(Icons.map),
      label: const Text('Ver Mapa'),
      backgroundColor: Colors.lightBlueAccent,
      onPressed: () {
        Navigator.pushNamed(context, '/mapa');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima para salvar el semestre'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.lightBlueAccent, Colors.black54],
          ),
        ),
        child: SafeArea(
          child: Obx(
            () => globalController.checkLoading().isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(height: sizedBoxHeight),
                        const HeaderWidget(),
                        CurrentWeather(
                          weatherDataCurrent:
                              globalController.getWeather().getCurrentWeather(),
                        ),
                        SizedBox(height: sizedBoxHeight),
                        HourlyDataWidget(
                          weatherDataHourly:
                              globalController.getWeather().getHourlyWeather(),
                        ),
                        DailyDataForecast(
                          weatherDataDaily:
                              globalController.getWeather().getDailyWeather(),
                        ),
                        Container(
                          height: 1,
                          color: CustomColors.dividerLine,
                        ),
                        SizedBox(height: sizedBoxHeight),
                      ],
                    ),
                  ),
          ),
        ),
      ),
      floatingActionButton: btnMapa,
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima Salvar Parcial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/mapa': (context) => MapScreen(),
      },
    );
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: const Center(
        child: Text('Pantalla del Mapa'),
      ),
    );
  }
}
