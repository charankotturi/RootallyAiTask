import 'dart:convert';

class ConvertModel {
  // void convertJsonToMap(String json){
  //   Map<String, String> map =
  // }

  static List<dynamic> covertJsonToList(String Json) {
    List<dynamic> list = json.decode(Json);
    return list;
  }

  static Map<String, dynamic> covertJsonToMap(String Json) {
    Map<String, dynamic> list = json.decode(Json);
    return list;
  }
}
