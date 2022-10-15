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
      () => ListView.builder(
        itemCount: controller.covidList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(255, 222, 44, 32),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.vaccines, color: Colors.white),
                  title: Text("Vaccination Card",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Text('Covid 19'),
                ),
                ListTile(
                    title: Text("Name"),
                    subtitle: Text(
                      '${controller.covertnumberToState(controller.covidList[index].states.toString())}',
                      style: TextStyle(fontSize: 20),
                    )),
                CustomText(
                  text:
                      'Date: ${controller.convertDateToString(controller.covidList[index].date.toString())}',
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
