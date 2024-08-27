// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, use_super_parameters, file_names, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:habit_tracker_app/services/chartsBuilder.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({Key? key}) : super(key: key);

  @override
  State createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(children: [
                Image.asset('assets/HabitsPageBackground.png'),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 140, 0, 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.black.withOpacity(0.5), // Background color
                      child: Column(children: const [
                        Text(
                          "Your Habits",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Use this to be inspired",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ]),
                    ),
                  ),
                )
              ]),
            ),
          ),
          Container(
            height: 513,
            child: ListView(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              children: [
                SizedBox(
                  height: 200,
                  child: LineChartSample1(),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: LineChartSample2(),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: LineChartSample3(),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
