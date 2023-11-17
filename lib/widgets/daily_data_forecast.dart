// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
// import 'package:weatherapp/model/wetaher_data_daily.dart';
// import 'package:weatherapp/utils/custom_colors.dart';
// import 'package:flutter/material.dart';

// class DailyDataForecast extends StatelessWidget {
//   final WeatherDataDaily weatherDataDaily;
//   const DailyDataForecast({Key? key, required this.weatherDataDaily})
//       : super(key: key);

//   // string manipulation
//   String getDay(int? day, DateFormat dateFormat) {
//     if (day == null) {
//       return '';
//     }

//     DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
//     final x = dateFormat.format(time);
//     return x;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dateFormat = DateFormat('EEE');
//     return Container(
//       height: 400,
//       margin: const EdgeInsets.all(20),
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: CustomColors.dividerLine.withOpacity(0.1), // Ajusta la opacidad aquí
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: CustomColors.textColorBlack.withOpacity(0.3),
//         ),
//         // Elimina la sombra
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.black.withOpacity(0.1),
//         //     spreadRadius: 2,
//         //     blurRadius: 4,
//         //     offset: Offset(0, 2), // changes position of shadow
//         //   ),
//         // ],
//       ),
//       child: Column(
//         children: [
//           Container(
//             alignment: Alignment.topLeft,
//             margin: const EdgeInsets.only(bottom: 10),
//             child: const Text(
//               "Próximos Días",
//               style: TextStyle(
//                 color: CustomColors.textColorBlack,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           dailyList(dateFormat),
//         ],
//       ),
//     );
//   }

//   Widget dailyList(DateFormat dateFormat) {
//     return SizedBox(
//       height: 300,
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: weatherDataDaily.daily.length > 7
//             ? 7
//             : weatherDataDaily.daily.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Container(
//                 height: 60,
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: CustomColors.textColorBlack.withOpacity(0.3),
//                     ),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       getDay(weatherDataDaily.daily[index].dt, dateFormat),
//                       style: const TextStyle(
//                         color: CustomColors.textColorBlack,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 40,
//                       width: 40,
//                       child: Image.asset(
//                         "assets/images/${weatherDataDaily.daily[index].weather![0].icon}.png",
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Text(
//                       "${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°",
//                       style: const TextStyle(
//                         color: CustomColors.textColorBlack,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/model/wetaher_data_daily.dart';
import 'package:weatherapp/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  // string manipulation
  String getDay(int? day, DateFormat dateFormat) {
    if (day == null) {
      return '';
    }

    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = dateFormat.format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('EEE');
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine
            .withOpacity(0.3), // Ajusta la opacidad aquí
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CustomColors.textColorBlack.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Próximos Días",
              style: TextStyle(
                color: CustomColors.textColorBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          dailyList(dateFormat),
        ],
      ),
    );
  }

  Widget dailyList(DateFormat dateFormat) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CustomColors.textColorBlack.withOpacity(0.3),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getDay(weatherDataDaily.daily[index].dt, dateFormat),
                      style: const TextStyle(
                        color: CustomColors.textColorBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        "assets/images/${weatherDataDaily.daily[index].weather![0].icon}.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°",
                      style: const TextStyle(
                        color: CustomColors.textColorBlack,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
