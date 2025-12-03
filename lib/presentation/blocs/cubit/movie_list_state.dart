import 'package:equatable/equatable.dart';
import 'package:parcial_3/models/movie_model.dart';

class MovieListState extends Equatable {
  
  const MovieListState();

  @override
  List<Object?> get props => [];
}

class Initial extends MovieListState {}
class Loading extends MovieListState {}
class Success extends MovieListState {
  final List<Movie> data;

  @override
  List<Object?> get props => [data];
  const Success(this.data);
}

class Error extends MovieListState {
  final String message;
  const Error(this.message);

  @override
  List<Object?> get props => [message];
}