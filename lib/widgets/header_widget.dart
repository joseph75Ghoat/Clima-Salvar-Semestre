// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:weatherapp/controllers/global_controller.dart';

// class HeaderWidget extends StatefulWidget {
//   const HeaderWidget({super.key});

//   @override
//   State<HeaderWidget> createState() => _HeaderWidgetState();
// }

// class _HeaderWidgetState extends State<HeaderWidget> {
//   String city = "";
//   String date = DateFormat("yMMMMd").format(DateTime.now());

//   final GlobalController globalController =
//       Get.put(GlobalController(), permanent: true);
//   @override
//   void initState() {
//     getAddress(globalController.getLattitude().value,
//         globalController.getLongitude().value);
//     super.initState();
//   }

//   getAddress(lat, lon) async {
//     List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
//     Placemark place = placemark[0];
//     setState(() {
//       city = place.locality!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.only(left: 20, right: 20),
//           alignment: Alignment.topLeft,
//           child: Text(
//             city,
//             style: const TextStyle(fontSize: 35, height: 2),
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//           alignment: Alignment.topLeft,
//           child: Text(
//             date,
//             style:
//                 TextStyle(fontSize: 14, color: const Color.fromARGB(255, 227, 224, 224), height: 1.5),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controllers/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center, // Center the text horizontally
          child: Text(
            city,
            style: const TextStyle(fontSize: 45, height: 1.5),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          alignment: Alignment.center, // Center the text horizontally
          child: Text(
            date,
            style: TextStyle(
              fontSize: 18,
              color: const Color.fromARGB(255, 227, 224, 224),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
