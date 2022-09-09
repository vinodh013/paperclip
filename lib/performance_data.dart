import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:paperclip/models/performance.dart';

import 'urls.dart';

class PerformanceData extends StatefulWidget {
  const PerformanceData({
    Key? key,
  }) : super(key: key);

  @override
  State<PerformanceData> createState() => _PerformanceDataState();
}

class _PerformanceDataState extends State<PerformanceData> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Performance",
            style: TextStyle(
                color: Color.fromARGB(255, 20, 32, 66),
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          Divider(),
          Flexible(
            child: FutureBuilder(
                future: Urls.bankPerformance,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return PerformanceRow(
                                    title: snapshot.data[index]['Label'],
                                    value: snapshot.data[index]['ChangePercent'],
                                    percent: snapshot.data[index]['ChangePercent'] /
                                        100);
                              }),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(child: const CircularProgressIndicator());
                })),
          ),
        ],
      ),
    );
  }
}

class PerformanceRow extends StatelessWidget {
  String title;
  double value;
  double percent;
  Color indicatorColor;
  PerformanceRow({
    Key? key,
    required this.title,
    required this.value,
    required this.percent,
    this.indicatorColor = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (percent < 0) {
      indicatorColor = Colors.red;
      percent = 0.01;
    } else if (percent > 1.0) {
      percent = 1;
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment,
        children: [
          Expanded(flex: 2, child: Text(title)),
          Expanded(
              flex: 5,
              child: LinearPercentIndicator(
                lineHeight: 15.0,
                barRadius: Radius.circular(4),
                percent: percent,
                progressColor: indicatorColor,
              )),
          Expanded(
            flex: 1,
            child: Text(
              value.toStringAsFixed(2),
              style: TextStyle(color: indicatorColor),
            ),
          )
        ],
      ),
    );
  }
}
