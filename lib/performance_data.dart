
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
   Future<List<Performance>>? performance;
   
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() {
    performance = Performance.fromJson( Urls.bankPerformance as Map<String, dynamic> ) as Future<List<Performance>>?  ;
    print(performance);
  }

  @override
  Widget build(BuildContext context) {
    return Text('hi');
//     return Flexible(
//       child: FutureBuilder(
//           future: Urls.bankPerformance,
//           builder: ((context, snapshot) {
//             // Map tomap = (snapshot.data);
//             // var performancekey = tomap.keys.toList();
//             // var performancevalue = tomap.values.toList();
//             var performance = Performance.fromJson(snapshot.data);
//             if (snapshot.hasData) {
//               return Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Overview",
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 20, 32, 66),
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Divider(),
//                     Flexible(
//                       child: ListView.builder(
//                           itemCount: snapshot.data,
//                           itemBuilder: (context, index) {
//                             // if (performancevalue[index] < 7) {
//                             //   return PerformanceRow(title:
//                             //    performancekey[index].toString(),
//                             //     value: performancevalue[index],
//                             //     percent: percent, indicatorColor: indicatorColor)
//                             // }
//                             return Text(responce.toString());
//                           }),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//             return Center(child: const CircularProgressIndicator());
//           })),
//     );
//   }
// }

// class PerformanceRow extends StatelessWidget {
//   String title;
//   int value;
//   double percent;
//   Color indicatorColor;
//   PerformanceRow({
//     Key? key,
//     required this.title,
//     required this.value,
//     required this.percent,
//     required this.indicatorColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title),
//         Expanded(
//             child: LinearPercentIndicator(
//           lineHeight: 8.0,
//           percent: percent,
//           progressColor: indicatorColor,
//         )),
//         Text(
//           value.toString(),
//           style: TextStyle(color: indicatorColor),
//         )
//       ],
//     );
  }
}
