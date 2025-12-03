import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcial_3/presentation/blocs/cubit/movie_list_state.dart';
import 'package:parcial_3/services/movie_api_service.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit() : super(Initial());

  Future<void> getData(String query) async {
    try {
      emit(Loading());
      if(query.isNotEmpty){
        emit(Success(await ApiService().getByQuery(query)));
      }
      else{
        emit(Success(await ApiService().getByPopularityDesc()));
      }
    } 
    catch (e) {
      emit(Error(e.toString()));
    }
  }
}