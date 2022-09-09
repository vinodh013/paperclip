import 'package:flutter/material.dart';
import 'package:paperclip/performance_data.dart';
import 'package:paperclip/services/http_services.dart';
import 'package:paperclip/urls.dart';

import 'models/response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Overview",
                    style: TextStyle(
                        color: Color.fromARGB(255, 20, 32, 66),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Divider(),
                  FutureBuilder(
                      future: Urls.bankOverview,
                      builder: ((context, snapshot) {
                        Map tomap = snapshot.data ?? {};
                        var reponcekey = tomap.keys.toList();
                        var reponcevalue = tomap.values.toList();
                        return Flexible(
                          child: ListView.builder(
                              itemCount: reponcekey.length,
                              itemBuilder: (context, index) {
                                if (snapshot.hasData) {
                                  if (reponcevalue[index].toString() ==
                                      'null') {
                                    return ReusalbleRow(
                                        title: reponcekey[index].toString(),
                                        value: "-");
                                  } else {
                                    return ReusalbleRow(
                                        title: reponcekey[index].toString(),
                                        value: reponcevalue[index].toString());
                                  }
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return Center(
                                    child: const CircularProgressIndicator());
                              }),
                        );
                      }))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PerformanceData()
          ],
        ),
      ),
    );
  }
}

class ReusalbleRow extends StatelessWidget {
  final String title;
  final String value;
  ReusalbleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    );
  }
}
