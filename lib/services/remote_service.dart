import 'dart:developer';
import 'dart:io';

import 'package:sup_demo/models/get_sup.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<SuppliersGet>?> getSup() async {
    try {
      var client = http.Client();

      var uri = Uri.parse(
          'https://jsonplaceholder.typicode.com/posts'
      var response = await client.get(uri, headers: {
        "Accept": "application/json, text/plain, */*",
        "Access-Control-Allow-Origin": "*"
      });

      if (response.statusCode == 200) {
        List<SuppliersGet> _supplier =
            suppliersGetFromJson(response.body.toString());
        return _supplier;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
