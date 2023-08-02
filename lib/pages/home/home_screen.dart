import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/images.dart';
import '../../controller/HomeController.dart';
import '../../model/current_weather_data.dart';
import '../../model/five_days_data.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return Column(
          children: <Widget>[
            Container(
                child: controller.isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(50),
                        child: Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(
                                  color: Colors.green, strokeWidth: 5),
                            ],
                          ),
                        ))
                    : Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black38, BlendMode.darken),
                              image: AssetImage(
                                'assets/images/cloud-in-blue-sky.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: ListView(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 100, left: 20, right: 20),
                                child: TextField(
                                  onChanged: (value) => controller.city = value,
                                  style:
                                      GoogleFonts.aBeeZee(color: Colors.white),
                                  textInputAction: TextInputAction.search,
                                  onSubmitted: (value) =>
                                      controller.updateWeather(),
                                  decoration: InputDecoration(
                                    suffix: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    hintStyle: GoogleFonts.aBeeZee(
                                        color: Colors.white),
                                    hintText: 'Search'.toUpperCase(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 15),
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //TODO
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 17,
                                                    left: 20,
                                                    right: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Center(
                                                      child: Text(
                                                        '${controller.currentWeatherData?.name}'
                                                            .toUpperCase(),
                                                        style:
                                                            GoogleFonts.aBeeZee(
                                                          color: Colors.black45,
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        DateFormat()
                                                            .add_MMMMEEEEd()
                                                            .format(
                                                                DateTime.now()),
                                                        style:
                                                            GoogleFonts.aBeeZee(
                                                          color: Colors.black45,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                            //TODO
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 50),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        '${controller.currentWeatherData?.weather![0].description}',
                                                        style:
                                                            GoogleFonts.aBeeZee(
                                                          color: Colors.black45,
                                                          fontSize: 22,
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                                        style:
                                                            GoogleFonts.aBeeZee(
                                                                color: Colors
                                                                    .black45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 70),
                                                      ),
                                                      Text(
                                                        'min: ${(controller.currentWeatherData?.main!.tempMin ?? -273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                                        style:
                                                            GoogleFonts.aBeeZee(
                                                          color: Colors.black45,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: 120,
                                                        height: 120,
                                                        child: LottieBuilder
                                                            .asset(Images
                                                                .cloudyAnim),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'wind ${controller.currentWeatherData?.wind!.speed} m/s',
                                                          style: GoogleFonts
                                                              .aBeeZee(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Container(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                'other city'.toUpperCase(),
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: 16,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 150,
                                              child: ListView.separated(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder:
                                                    (context, index) =>
                                                        const VerticalDivider(
                                                  color: Colors.transparent,
                                                  width: 5,
                                                ),
                                                itemCount:
                                                    controller.dataList.length,
                                                itemBuilder: (context, index) {
                                                  CurrentWeatherData? data;
                                                  (controller.dataList.length >
                                                          0)
                                                      ? data = controller
                                                          .dataList[index]
                                                      : data = null;
                                                  return Container(
                                                    width: 140,
                                                    height: 150,
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Text(
                                                              (data != null)
                                                                  ? '${data.name}'
                                                                  : '',
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black45,
                                                              ),
                                                            ),
                                                            Text(
                                                              (data != null)
                                                                  ? '${(data.main!.temp! - 273.15).round().toString()}\u2103'
                                                                  : '',
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black45,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child: LottieBuilder
                                                                  .asset(Images
                                                                      .cloudyAnim),
                                                            ),
                                                            Text(
                                                              (data != null)
                                                                  ? '${data.weather![0].description}'
                                                                  : '',
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                color: Colors
                                                                    .black45,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    'forcast next 5 days'
                                                        .toUpperCase(),
                                                    style: GoogleFonts.aBeeZee(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black45,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.area_chart_outlined,
                                                    color: Colors.black45,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 240,
                                              child: Card(
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: SfCartesianChart(
                                                  primaryXAxis: CategoryAxis(),
                                                  series: <ChartSeries<
                                                      FiveDayData, String>>[
                                                    SplineSeries<FiveDayData,
                                                        String>(
                                                      dataSource: controller
                                                          .fiveDaysData,
                                                      xValueMapper:
                                                          (FiveDayData f, _) =>
                                                              f.dateTime,
                                                      yValueMapper:
                                                          (FiveDayData f, _) =>
                                                              f.temp,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
          ],
        );
      }),
    );
  }

  Object _log() {
    if (Get.isSnackbarOpen) {
      return const Center(child: CircularProgressIndicator());
    }
    return false;
  }
}
