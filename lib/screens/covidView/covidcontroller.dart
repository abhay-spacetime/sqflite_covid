import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqlicrud_demo/screens/covidView/state.dart';
import 'package:sqlicrud_demo/screens/covidView/test.dart';

import '../../service/model/covid_model.dart';
import 'package:http/http.dart' as http;

class CovidController extends GetxController {
  RxList covidList = [].obs;
  @override
  void onInit() async {
    covidList.value = await fetchCovidFromApi();
    super.onInit();
  }

  String convertDateToString(String date) {
    var year = date.substring(0, 4);
    var month = date.substring(4, 6);
    var day = date.substring(6, 8);
    return day + '/' + month + '/' + year;
  }

  String covertnumberToState(String num) {
    var value = state[num];
    return value.toString();
  }
}
