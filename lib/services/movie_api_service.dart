import 'package:dio/dio.dart';
import '/models/movie_model.dart';
import '../config/env.dart';

class ApiService{
  Future<List<Movie>> getByPopularityDesc() async{
    try{
      List<dynamic> responseData;

      Response response = await Dio().get('https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=$apiKey');
      if(response.statusCode == 200){
        responseData = response.data['results'];
      }
      else{
        responseData = List.empty();
      }
      return responseData.map((json) => Movie.fromJson(json)).toList();
    }
    catch(e){
      throw Exception('$e');
    }
  }
  Future<List<Movie>> getByQuery(String query) async{
    try{
      List<dynamic> responseData;
      
      Response response = await Dio().get('https://api.themoviedb.org/3/search/movie?query=$query&api_key=$apiKey');
      if(response.statusCode == 200){
        responseData = response.data['results'];
      }
      else{
        responseData = List.empty();
      }
      return responseData.map((json) => Movie.fromJson(json)).toList();
    }
    catch(e){
      throw Exception('$e');
    }
  }
}