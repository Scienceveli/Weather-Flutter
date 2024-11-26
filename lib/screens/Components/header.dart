import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/globle_controller.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String city = "";
  String date = DateFormat.yMMMEd().format(DateTime.now());

  final GlobleController globleController =
      Get.put(GlobleController(), permanent: true);
  @override
  void initState() {
    getAddress(globleController.getlattitude().value,
        globleController.getlongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    log(placemark.toString());
    Placemark place = placemark[0];

    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          alignment: Alignment.center,
          child: Text(
            city,
            style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
          alignment: Alignment.center,
          child: Text(
            date,
            style: const TextStyle(fontSize: 15, color: Colors.grey, height: 1),
          ),
        )
      ],
    );
  }
}
