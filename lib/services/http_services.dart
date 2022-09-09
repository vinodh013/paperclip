import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paperclip/models/performance.dart';

import 'package:paperclip/models/response.dart';

class HttpService {
  

  HttpService(
   
  );

  Future getBankDetail(url) async {
    
    var client = http.Client();
    final uri = Uri.parse(url);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return json.decode(response.body) ;
    } else {
      return ('no text found');
    }
  }
}



