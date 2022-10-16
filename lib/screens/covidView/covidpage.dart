import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sqlicrud_demo/screens/covidView/covidcontroller.dart';
import 'package:sqlicrud_demo/screens/widgets/custom_text.dart';

class CovidPage extends GetView<CovidController> {
  static String id = '/covidpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.loading == true
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.covidList.length,
              itemBuilder: (context, index) {
                var crtcontller = controller.covidList[index];
                return GestureDetector(
                  onTap: () {
                    controller.dropdown[index].value =
                        !controller.dropdown[index].value;
                  },
                  child: Card(
                    // color: Colors.grey[500],
                    child: Column(
                      children: [
                        ListTile(
                            leading: Icon(Icons.vaccines, color: Colors.red),
                            title: Text(
                                "${controller.convertDateToString(controller.covidList[index].date.toString())}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.arrow_drop_down)),
                        Obx(
                          () => controller.dropdown[index].value
                              ? Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22),
                                    child: Column(
                                      children: [
                                        customRow(
                                          'states :',
                                          controller.covertnumberToState(
                                            crtcontller.states.toString(),
                                          ),
                                        ),
                                        customRow('positive :',
                                            crtcontller.positive.toString()),
                                        customRow('negative :',
                                            crtcontller.negative.toString()),
                                        customRow('pending :',
                                            crtcontller.pending.toString()),
                                        customRow(
                                            'hospitalized Currently :',
                                            crtcontller.hospitalizedCurrently
                                                .toString()),
                                        customRow(
                                            'hospitalized Cumulative :',
                                            crtcontller.hospitalizedCumulative
                                                .toString()),
                                        customRow(
                                            'in Icu Currently :',
                                            crtcontller.inIcuCurrently
                                                .toString()),
                                        customRow(
                                            'in Icu Cumulative :',
                                            crtcontller.inIcuCumulative
                                                .toString()),
                                        customRow(
                                            'on Ventilator Currently :',
                                            crtcontller.onVentilatorCurrently
                                                .toString()),
                                        customRow(
                                            'on Ventilator Cumulative :',
                                            crtcontller.onVentilatorCumulative
                                                .toString()),
                                        customRow('date Checked :',
                                            crtcontller.dateChecked.toString()),
                                        customRow('death :',
                                            crtcontller.death.toString()),
                                        customRow(
                                            'hospitalized :',
                                            crtcontller.hospitalized
                                                .toString()),
                                        customRow(
                                            'total Test Results :',
                                            crtcontller.totalTestResults
                                                .toString()),
                                        customRow(
                                            'death Increase :',
                                            crtcontller.deathIncrease
                                                .toString()),
                                        customRow(
                                            'hospitalized Increase :',
                                            crtcontller.hospitalizedIncrease
                                                .toString()),
                                        customRow(
                                            'negative Increase :',
                                            crtcontller.negativeIncrease
                                                .toString()),
                                        customRow(
                                            'positive Increase :',
                                            crtcontller.positiveIncrease
                                                .toString()),
                                        customRow(
                                            'total Test Results Increase :',
                                            crtcontller.totalTestResultsIncrease
                                                .toString()),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    ));
  }
}

Widget customRow(String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title.capitalizeFirst!,
          fontSize: 16,
        ),
        CustomText(
          text: value.capitalizeFirst!,
          fontSize: 14,
          color: Colors.grey[800]!,
        ),
      ],
    ),
  );
}
