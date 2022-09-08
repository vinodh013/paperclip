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
 // late Future<Response>? response;
 // var isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 700,
              child: FutureBuilder(
                  future: Urls.bankOverview,
                  builder: ((context, snapshot) {
                    Map tomap = (snapshot.data);
                    var reponcekey = tomap.keys.toList();
                    var reponcevalue = tomap.values.toList();

                    // var responce = Response.fromJson(snapshot.data);
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                               const Text("Overview",style: TextStyle(
                                  color: Color.fromARGB(255, 20, 32, 66),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                                ),),
                                Divider(),
                            Flexible(
                              child: ListView.builder(
                                  itemCount: reponcekey.length,
                                  itemBuilder: (context, index) {
                                    if (reponcevalue[index] == null) {
                                      return ReusalbleRow(
                                          title: reponcekey[index].toString(),
                                          value: "-");
                                    }
                                    return ReusalbleRow(
                                        title: reponcekey[index].toString(),
                                        value: reponcevalue[index].toString());
                                  }),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return Center(child: const CircularProgressIndicator());
                  })
                  ),
            ),
            PerformanceData()
          ],
        ),
      ),
    );
  }
}

class ReusalbleRow extends StatelessWidget {
  String title, value;
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
