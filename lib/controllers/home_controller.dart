import "dart:convert";
import "package:hotels_app/constant.dart";
import "package:hotels_app/model/hotel_model.dart";
import "package:http/http.dart" as http;
import 'package:get/get.dart';
class HomeController extends GetxController{
    Future<List<HotelModel>> getData()async{
      var respons=await http.get(Uri.parse(apiKey)); 
     if(respons.statusCode==200){
        var data=json.decode(respons.body) as List;
        return data.map((movie) => HotelModel.fromJson(movie)).toList();
     }else{
      throw Exception('Something happened');
     }
    }

  }
