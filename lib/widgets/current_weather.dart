// import 'package:flutter/material.dart';
// import 'package:weatherapp/model/weather_data_current.dart';
// import 'package:weatherapp/utils/custom_colors.dart';

// class CurrentWeather extends StatelessWidget {
//   final WeatherDataCurrent weatherDataCurrent;

//   const CurrentWeather({Key? key, required this.weatherDataCurrent})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         temperatureAreaWidget(),
//         const SizedBox(
//           height: 20,
//         ),
//         currentWeatherMoreDetailsWidget(),
//       ],
//     );
//   }

//   Widget currentWeatherMoreDetailsWidget() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               height: 60,
//               width: 60,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                   color: CustomColors.cardColor,
//                   borderRadius: BorderRadius.circular(15)),
//               child: Image.asset("assets/animation/nubes.gif"),
//             ),
//             Container(
//               height: 60,
//               width: 60,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                   color: CustomColors.cardColor,
//                   borderRadius: BorderRadius.circular(15)),
//               child: Image.asset("assets/animation/nublado.gif"),
//             ),
//             Container(
//               height: 60,
//               width: 60,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                   color: CustomColors.cardColor,
//                   borderRadius: BorderRadius.circular(15)),
//               child: Image.asset("assets/animation/lluvia.gif"),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             SizedBox(
//               height: 20,
//               width: 60,
//               child: Text(
//                 "${weatherDataCurrent.current.windSpeed}km/h",
//                 style: const TextStyle(fontSize: 12),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//               width: 60,
//               child: Text(
//                 "${weatherDataCurrent.current.clouds}%",
//                 style: const TextStyle(fontSize: 12),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//               width: 60,
//               child: Text(
//                 "${weatherDataCurrent.current.humidity}%",
//                 style: const TextStyle(fontSize: 12),
//                 textAlign: TextAlign.center,
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }

//   Widget temperatureAreaWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Image.asset(
//           "assets/images/${weatherDataCurrent.current.weather![0].icon}.png",
//           height: 80,
//           width: 80,
//         ),
//         Container(
//           height: 50,
//           width: 1,
//           color: CustomColors.textColorBlack,
//         ),
//         RichText(
//           text: TextSpan(children: [
//             TextSpan(
//                 text: "${weatherDataCurrent.current.temp!.toInt()}°",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 68,
//                   color: CustomColors.textColorBlack,
//                 )),
//             TextSpan(
//                 text: "${weatherDataCurrent.current.weather![0].description}",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   color: Colors.grey,
//                 )),
//           ]),
//         )
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:weatherapp/model/weather_data_current.dart';
// import 'package:weatherapp/utils/custom_colors.dart';

// class CurrentWeather extends StatelessWidget {
//   final WeatherDataCurrent weatherDataCurrent;

//   const CurrentWeather({Key? key, required this.weatherDataCurrent})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         temperatureAreaWidget(),
//         const SizedBox(height: 20),
//         currentWeatherMoreDetailsWidget(),
//       ],
//     );
//   }

//   Widget currentWeatherMoreDetailsWidget() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             weatherDetailContainer("assets/animation/nubes.gif"),
//             weatherDetailContainer("assets/animation/nublado.gif"),
//             weatherDetailContainer("assets/animation/lluvia.gif"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             weatherDetailText("${weatherDataCurrent.current.windSpeed}km/h"),
//             weatherDetailText("${weatherDataCurrent.current.clouds}%"),
//             weatherDetailText("${weatherDataCurrent.current.humidity}%"),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget weatherDetailContainer(String assetPath) {
//     return Container(
//       height: 60,
//       width: 60,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: CustomColors.cardColor.withOpacity(0.5), // Ajusta la opacidad según sea necesario
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: Colors.black), // Agrega el borde negro
//       ),
//       child: Image.asset(assetPath),
//     );
//   }

//   Widget weatherDetailText(String text) {
//     return SizedBox(
//       height: 20,
//       width: 60,
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 12),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Widget temperatureAreaWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Image.asset(
//           "assets/images/${weatherDataCurrent.current.weather![0].icon}.png",
//           height: 80,
//           width: 80,
//         ),
//         const VerticalDivider(
//           color: CustomColors.textColorBlack,
//           width: 1,
//         ),
//         Expanded(
//           child: RichText(
//             text: TextSpan(children: [
//               TextSpan(
//                 text: "${weatherDataCurrent.current.temp!.toInt()}°",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 68,
//                   color: CustomColors.textColorBlack,
//                 ),
//               ),
//               TextSpan(
//                 text: "${weatherDataCurrent.current.weather![0].description}",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/utils/custom_colors.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeather({Key? key, required this.weatherDataCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
        const SizedBox(height: 20),
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            weatherDetailContainer("assets/animation/nubes.gif", "Nubes"),
            weatherDetailContainer("assets/animation/nublado.gif", "Nublado"),
            weatherDetailContainer("assets/animation/lluvia.gif", "Lluvia"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            weatherDetailText("${weatherDataCurrent.current.windSpeed}km/h", "Viento"),
            weatherDetailText("${weatherDataCurrent.current.clouds}%", "Nubosidad"),
            weatherDetailText("${weatherDataCurrent.current.humidity}%", "Humedad"),
          ],
        ),
      ],
    );
  }

  Widget weatherDetailContainer(String assetPath, String description) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CustomColors.cardColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black),
          ),
          child: Image.asset(assetPath),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget weatherDetailText(String text, String description) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          width: 60,
          child: Text(
            text,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        weatherIcon(),
        const VerticalDivider(color: CustomColors.textColorBlack, width: 1),
        weatherTemperature(),
      ],
    );
  }

  Widget weatherIcon() {
    return Image.asset(
      "assets/images/${weatherDataCurrent.current.weather![0].icon}.png",
      height: 80,
      width: 80,
    );
  }

  Widget weatherTemperature() {
    return Expanded(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "${weatherDataCurrent.current.temp!.toInt()}°",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 68,
                color: CustomColors.textColorBlack,
              ),
            ),
            TextSpan(
              text: "${weatherDataCurrent.current.weather![0].description}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
