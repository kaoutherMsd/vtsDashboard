import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/model/telemetry_model.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class TelemetryDetailsCard extends StatefulWidget {
  const TelemetryDetailsCard({Key? key}) : super(key: key);

  @override
  _TelemetryDetailsCardState createState() => _TelemetryDetailsCardState();
}

class _TelemetryDetailsCardState extends State<TelemetryDetailsCard> {
  late DatabaseReference _telemetryRef; // Remove 'late' keyword
  bool firebaseInitialized = false; // Track Firebase initialization

  @override
  void initState() {
    super.initState();

    // Initialize Firebase with your specific Realtime Database URL
    Firebase.initializeApp().then((_) {
      setState(() {
        firebaseInitialized = true;

        // Specify your Firebase Realtime Database URL
        const databaseUrl = 'https://esp32test-4f2c1-default-rtdb.europe-west1.firebasedatabase.app';
        _telemetryRef = FirebaseDatabase.instanceFor(
            app: Firebase.app(),
            databaseURL: databaseUrl).ref().child('UsersData')
            .child('9pm7q7uN1bcXocU7tBis2RzT7OI3')
            .child('readings')
            .child('1692713315'); // Assuming you want real-time updates from this specific timestamp

        // Listen for real-time data changes
        _telemetryRef.onValue.listen((DatabaseEvent event) {
          // Parse the event snapshot to get the telemetry data
          final Map<dynamic, dynamic>? telemetryData =
              event.snapshot.value as Map<dynamic, dynamic>?;
          if (telemetryData != null) {
            // Update the UI with the new telemetry data
            setState(() {
              telemetryDetails[0].value = telemetryData['speed'] ?? "";
              telemetryDetails[1].value = telemetryData['acceleration'] ?? "";
              telemetryDetails[2].value = telemetryData['temperature'] ?? "";
              telemetryDetails[3].value = telemetryData['humidity'] ?? "";
            });
          }
        });
      });
    });
  }

  final List<TelemetryModel> telemetryDetails = [
    TelemetryModel(
      icon: 'assets/svg/speed.svg',
      value: "60",
      unit: "Km/h",
      title: "Speed",
    ),
    TelemetryModel(
      icon: 'assets/svg/acceleration.svg',
      value: "20",
      unit: "m/s²",
      title: "Acceleration",
    ),
    TelemetryModel(
      icon: 'assets/svg/temperature.svg',
      value: "90",
      unit: "°C",
      title: "Temperature",
    ),
    TelemetryModel(
      icon: 'assets/svg/humidity.svg',
      value: "60",
      unit: "%",
      title: "Humidity",
    ),
  ];

  @override
  Widget build(BuildContext context) {
     if (!firebaseInitialized) {
      // Return a loading or error message, or handle it as needed
      return const Center(
        child: CircularProgressIndicator(), // Loading indicator
      );
    }
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(telemetryDetails[i].icon),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                      '${telemetryDetails[i].value} ${telemetryDetails[i].unit}',                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                telemetryDetails[i].title,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
      },
    );
  }
  

}
