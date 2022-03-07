import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:newanewsapi/model/news_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  static List? datas = [];

  static Future getNewsApi(
    String q,
    String language,
    String sortedBy,
  ) async {
    await openBox();

    
    String country = "es";
    
    String from_param = "2022-01-27";
    String to = "2022-01-27";
   

    try {
      var queryParametres = {
        "q": q,
        "language": language,
        "from": from_param,
        "to": to,
        "sortBy": sortedBy,
      };
      var header = {
        HttpHeaders.authorizationHeader: ""
      };
      var url = Uri.https("newsapi.org", "/v2/everything", queryParametres);

      dynamic response = await http.get(url, headers: header);

      response = jsonDecode(response.body);

      await putData(response);
    } catch (e) {
      return "Network error";
    }
    List myData = box!.toMap().values.toList();

    if (myData.isEmpty) {
      datas!.add("nodata");
    } else {
      datas = myData;
    }

    return true;
  }

  static Box? box;
  static Future openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox("data");
  }

  static putData(var data) async {
    await box!.clear();

    for (var d in data["articles"]) {
      box!.add(d);
    }
  }
}
