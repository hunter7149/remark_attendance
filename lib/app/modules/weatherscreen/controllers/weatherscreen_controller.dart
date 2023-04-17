import 'package:attendance/app/api/repository/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as gcode;

class WeatherscreenController extends GetxController {
  RxDouble lattitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address = "".obs;
  RxBool isLocationLoading = false.obs;

  getlocation() async {
    isLocationLoading.value = true;
    update();
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return LocationData;
      }
    }
    await location.changeSettings(
      accuracy: LocationAccuracy.high,
    );
    _locationData = await location.getLocation();
    // print(_locationData.latitude);

    LocationData locationData = _locationData;
    lattitude.value = locationData.latitude ?? 0.0;
    longitude.value = locationData.longitude ?? 0.0;
    update();

    List<gcode.Placemark> placemarks = await gcode.placemarkFromCoordinates(
        double.parse(lattitude.value.toStringAsFixed(4)),
        double.parse(longitude.value.toStringAsFixed(4)));
    address.value = "${placemarks[0].street}" +
        "," +
        "${placemarks[0].subLocality}" +
        "," +
        "${placemarks[0].locality}" +
        "-" +
        "${placemarks[0].postalCode}";
    isLocationLoading.value = false;
    Map<String, dynamic> tempLocation = {
      "time": DateTime.now().toString().split(" ")[1],
      "lattitude": "${double.parse(lattitude.value.toStringAsFixed(4))}",
      "longitude": "${double.parse(longitude.value.toStringAsFixed(4))}",
      "name": address.value
    };

    update();
    print("${address.value}");
    return locationData;
  }

  RxMap<String, dynamic> weatherData = <String, dynamic>{}.obs;
  RxBool isWeatherLoading = false.obs;

  requestWeather() async {
    isWeatherLoading.value = true;
    update();
    await getlocation();
    if (lattitude.value != 0.0 && longitude.value != 0.0) {
      await Repository()
          .requestWeather(
              lattitude: lattitude.value, longitude: longitude.value)
          .then((value) {
        if (value != null) {
          print(value);
          weatherData.value = value;
          weatherData.refresh();
        }
        isWeatherLoading.value = false;
        update();
      });
    }
  }

  onlyTime({required String dateString}) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('h:mm a').format(date);

    print(formattedDate); // Output: 6:00 PM

    return formattedDate;
  }

  @override
  void onInit() {
    super.onInit();
    requestWeather();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
