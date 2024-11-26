import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_appgetx/Models/Weatherdata.dart';
import 'package:weather_appgetx/controller/api/fetch_weather.dart';

class GlobleController extends GetxController {
  //! Variable
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _cardIndex = 0.obs;
  //! Instance For Them Called
  RxBool checkLoading() => _isLoading;
  RxDouble getlattitude() => _lattitude;
  RxDouble getlongitude() => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getWeather() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnable;
    LocationPermission locationPermission;

    isServiceEnable = await Geolocator.isLocationServiceEnabled();
    //! return if service not available
    if (!isServiceEnable) {
      return Future.error('Location not available');
    }
    //! status permission
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permisson are denided forever');
    } else if (locationPermission == LocationPermission.denied) {
      //! request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    //! GET THE CURRENT LOCATION

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //Update Lattitude and Longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      //! After Update Current Location Calling Api Here
      return FetchWeatherApi()
          .getWeatherData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value as WeatherData;
        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _cardIndex;
  }
}
