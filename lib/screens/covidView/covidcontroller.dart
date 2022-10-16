import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqlicrud_demo/screens/covidView/state.dart';
import 'package:sqlicrud_demo/screens/covidView/test.dart';

import '../../service/model/covid_model.dart';
import 'package:http/http.dart' as http;

class CovidController extends GetxController {
  RxList covidList = [].obs;
  RxBool loading = true.obs;
  List<RxBool> dropdown = [];
  @override
  void onInit() async {
    try {
      loading.value = true;
      covidList.value = await fetchCovidFromApi();
      covidList.forEach((element) => dropdown.add(false.obs));
      loading.value = false;
    } catch (e) {
      print('Error:fetch data from api${e}');
    }
    super.onInit();
  }

  void dropdownChanged() {}

  String convertDateToString(String date) => DateFormat("dd-MMM-yyyy").format(DateTime.parse(date));

  String covertnumberToState(String num) => state[num].toString();
}
