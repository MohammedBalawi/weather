import '/api/api_repository.dart';
import '../../model/current_weather_data.dart';
import '../../model/five_days_data.dart';

class WeatherService {
  final String city;
//https://api.openweathermap.org/data/2.5/weather?q=cairo&mode=json&appid=84d3eb0ba43561553dec73bcecdfe73e
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=84d3eb0ba43561553dec73bcecdfe73e';


  WeatherService({required this.city});

  Future<void> getCurrentWeatherData({
    Function()? beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) async{
    final url =await '$baseUrl/weather?q=$city&lang=en&$apiKey';
    ApiRepository(
      url: '$url',
    ).get(
        beforeSend: ()async => {
              if (beforSend != null)
                {
               await   beforSend(),
                },
            },
        onSuccess: (data)async => {
           await   onSuccess!(CurrentWeatherData.fromJson(data)),
            },
        onError: (error)async => {
              if (onError != null)
                {
                  print(error),
                await  onError(error),
                }
            });
  }

  Future<void> getFiveDaysThreeHoursForcastData({
    Function()? beforSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) async{
    final url =await '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepository(
      url: '$url',
    ).get(
        beforeSend: ()async => {},
        onSuccess: (data)async => {
           await   onSuccess!((data['list'] as List)
                  .map((t) => FiveDayData.fromJson(t))
                  .toList())
            },
        onError: (error)async => {
              print(error),
            await  onError!(error),
            });
  }
}
