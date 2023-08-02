import 'package:get/get_state_manager/get_state_manager.dart';
import '../api/service/weather_service.dart';
import '../model/current_weather_data.dart';
import '../model/five_days_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String? city;
  String? searchText;
  bool isLoading = true ;


  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  HomeController({required this.city});

  @override
  void onInit()async {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  Future<void> updateWeather()async {
    initState();
  }

  void initState()async {
   await getCurrentWeatherData();
  await  getFiveDaysData();
  }

  Future<void> getCurrentWeatherData() async{
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          isLoading =false;
          update();
        },
        onError: (error) => {
          print(error),

          update(),

        });
  }

  void getTopFiveCities()async {
    List<String> cities = await [
      'gaza',
      'rafah',
      'jabalia',
      'egypt',
      'jerusalem'
    ];
    cities.forEach((c) {
      WeatherService(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }

  Future<void> getFiveDaysData() async {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      print(error);
      update();
    });
  }
}
