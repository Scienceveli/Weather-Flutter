import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_appgetx/controller/globle_controller.dart';
import 'package:weather_appgetx/screens/pages/Comfert_Level.dart';
import 'package:weather_appgetx/screens/pages/Daily_weather.dart';
import 'package:weather_appgetx/screens/pages/current_weather.dart';
import 'package:weather_appgetx/screens/pages/hourlyUpdate.dart';
import 'package:weather_appgetx/screens/Components/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobleController globleController =
      Get.put(GlobleController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Obx(
          () => globleController.checkLoading().isTrue
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/clouds.png',
                        height: 250,
                        width: 250,
                      ),
                      const CircularProgressIndicator()
                    ],
                  ),
                )
              : Center(
                  child: ListView(
                    physics: const ScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      //!Location Header
                      const Header(),
                      //! Current Temp

                      CurrentWeatherWidget(
                          weatherdatacurrent: globleController
                              .getWeather()
                              .getCurrentWeather()),

                      HourlyData(
                        weatherDataHourly:
                            globleController.getWeather().getHourlyWeather(),
                      ),

                      DailyWeather(
                        weatherDataDaily:
                            globleController.getWeather().getDailyWeather(),
                      ),

                      ComfortLevel(
                          weatherDataCurrent:
                              globleController.getWeather().getCurrentWeather())
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
