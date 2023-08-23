///import 'package:firebase_database/firebase_database.dart';

///class FirebaseService {
  ///final DatabaseReference _database = FirebaseDatabase.instance.reference();

  // Fetch temperature data from Firebase
 /// Future<double> getTemperatureData() async {
    ///DataSnapshot snapshot = await _database.child('temperature').once();
    ///return double.tryParse(snapshot.value.toString()) ?? 0.0;
 /// }

  // Fetch humidity data from Firebase
  ////Future<double> getHumidityData() async {
    ///DataSnapshot snapshot = await _database.child('humidity').once();
    ///return double.tryParse(snapshot.value.toString()) ?? 0.0;
  ///}

  // Fetch speed data from Firebase
  ///Future<double> getSpeedData() async {
   /// DataSnapshot snapshot = await _database.child('speed').once();
    ///return double.tryParse(snapshot.value.toString()) ?? 0.0;
  ///}

  // Fetch acceleration data from Firebase
 //// Future<double> getAccelerationData() async {
   /// DataSnapshot snapshot = await _database.child('acceleration').once();
    ///return double.tryParse(snapshot.value.toString()) ?? 0.0;
 /// }
///}
//////////////////////////////////////////////
///import 'package:firebase_database/firebase_database.dart';

///class FirebaseService {
  ///final DatabaseReference _database = FirebaseDatabase.instance.reference();

  // Create a stream controller for temperature data
  ///final StreamController<double> _temperatureStreamController =
   ///   StreamController<double>();

  // Create a stream controller for humidity data
  ///final StreamController<double> _humidityStreamController =
     /// StreamController<double>();

  // Create a stream controller for speed data
  ///final StreamController<double> _speedStreamController =
     /// StreamController<double>();

  // Create a stream controller for acceleration data
  ///final StreamController<double> _accelerationStreamController =
     /// StreamController<double>();

  // Initialize the stream with real-time data updates
  ///FirebaseService() {
    ///_database.child('temperature').onValue.listen((event) {
      ///final value = double.tryParse(event.snapshot.value.toString()) ?? 0.0;
      ///_temperatureStreamController.add(value);
    ///});

    ///_database.child('humidity').onValue.listen((event) {
      ///final value = double.tryParse(event.snapshot.value.toString()) ?? 0.0;
      ///_humidityStreamController.add(value);
    ///});

   /// _database.child('speed').onValue.listen((event) {
      ///final value = double.tryParse(event.snapshot.value.toString()) ?? 0.0;
      ///_speedStreamController.add(value);
    ///});

    ///_database.child('acceleration').onValue.listen((event) {
      ///final value = double.tryParse(event.snapshot.value.toString()) ?? 0.0;
      ///_accelerationStreamController.add(value);
    ///});
  ///}

  // Dispose of the stream controllers when they are no longer needed
  ///void dispose() {
    ////_temperatureStreamController.close();
    ///_humidityStreamController.close();
    ///_speedStreamController.close();
    ///_accelerationStreamController.close();
  ///}

  // Provide access to the streams for each chart
  ///Stream<double> get temperatureStream => _temperatureStreamController.stream;
  ///Stream<double> get humidityStream => _humidityStreamController.stream;
  ///Stream<double> get speedStream => _speedStreamController.stream;
  ///Stream<double> get accelerationStream => _accelerationStreamController.stream;
//}
