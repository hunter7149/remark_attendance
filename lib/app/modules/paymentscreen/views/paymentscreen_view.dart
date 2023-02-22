import 'package:attendance/app/data/globals/app_colors.dart';
import 'package:attendance/app/data/globals/common_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/paymentscreen_controller.dart';

class PaymentscreenView extends GetView<PaymentscreenController> {
  const PaymentscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: COMMONWIDGET.globalAppBar(
            tittle: "Payments",
            backFunction: () {
              Get.back();
            }),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //-----------------Main padding----------------//
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                //-------------Search Section-------------------//
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 0.7, color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      //------------------Start date section-------------------------//
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Start Date: ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              // alignment: Alignment.center,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(5),
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.7, color: Colors.grey.shade600),
                                  borderRadius: BorderRadius.circular(10)),
                              child: DateTimePicker(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                // icon: Icon(Icons.edit),
                                textAlign: TextAlign.center,
                                use24HourFormat: false,
                                initialValue: controller.startDate.toString(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                // dateLabelText: 'Date',
                                onChanged: (val) {
                                  controller.startDate = DateTime.parse(val);
                                  print(controller.startDate);
                                },
                                validator: (val) {
                                  print(val);
                                  return null;
                                },
                                onSaved: (val) {
                                  controller.startDate = DateTime.parse(val!);
                                  print(controller.startDate);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      //---------------------End date section-------------------------//
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Start Date: ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              // alignment: Alignment.center,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(5),
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.7, color: Colors.grey.shade600),
                                  borderRadius: BorderRadius.circular(10)),
                              child: DateTimePicker(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                // icon: Icon(Icons.edit),
                                textAlign: TextAlign.center,
                                use24HourFormat: false,
                                initialValue: controller.endDate.toString(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                // dateLabelText: 'Date',
                                onChanged: (val) {
                                  controller.endDate = DateTime.parse(val);
                                  print(controller.endDate);
                                },
                                validator: (val) {
                                  print(val);
                                  return null;
                                },
                                onSaved: (val) {
                                  controller.endDate = DateTime.parse(val!);
                                  print(controller.endDate);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      COMMONWIDGET.button(
                        title: "Search",
                        funtion: () {},
                        backgroudcolor: Colors.green,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //--------------------Data section--------------------//
                Container(
                  child: Row(
                    //--------------Main Row-------------------------//
                    children: [
                      //---------Earning section--------//
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                )),
                            child: Center(
                              child: Text(
                                "Earnings",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller
                                .paymentList['data']['earnings'].length,
                            itemBuilder: (context, index) {
                              final key = controller
                                  .paymentList['data']['earnings'].keys
                                  .elementAt(index);
                              final value = controller.paymentList['data']
                                  ['earnings'][key];
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.7,
                                        color: Colors.grey.shade300)),
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${key}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "${value}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      )),
                      Container(
                        // height: double.maxFinite,
                        width: 1,
                        color: Colors.red,
                      ),
                      //---------------Deduction section-----------------//
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10))),
                            child: Center(
                              child: Text(
                                "Deductions",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller
                                .paymentList['data']['deduction'].length,
                            itemBuilder: (context, index) {
                              final key = controller
                                  .paymentList['data']['deduction'].keys
                                  .elementAt(index);
                              final value = controller.paymentList['data']
                                  ['deduction'][key];
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.7,
                                        color: Colors.grey.shade300)),
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${key}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "${value}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
