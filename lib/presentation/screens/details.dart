import 'package:flutter/material.dart';
import 'package:parcial_3/models/movie_model.dart';
import 'package:parcial_3/presentation/widgets/network_image_builder.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

@override
  Widget build(BuildContext context) {
    return DetailsView(movie: movie).build(context);
  }
}

class DetailsView extends StatelessWidget{
  final Movie movie;

  const DetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text('Movies'), 
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
        body: Center( 
          child: SingleChildScrollView(
      child: Column(
        children: [
          Title(
            color: Colors.black, 
            child: Text(
              movie.title, 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 24,
              )
            )
          ),
          AspectRatio(
            aspectRatio: 16/9,
              child: Image.network( 
              errorBuilder: (context, error, stacktrace){
                return NetworkImageBuilder().build(context, movie.posterUrl);
              },
              movie.posterUrl,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            decoration: BoxDecoration(

            )
          ),
          Text('Release Date: ${movie.releaseDate}'),
          Padding(padding: EdgeInsetsGeometry.all(8)),
          Text('Overview:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
          Text(movie.overview),
          Padding(padding: EdgeInsetsGeometry.all(8)),
          Table(
            children: [
              TableRow(
                children: [
                  Text('Rating:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14), textAlign: TextAlign.center),
                  Text('Votes:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14), textAlign: TextAlign.center,)
                ] 
              ),
              TableRow(
                children: [
                  Text(movie.voteAverage.toString(), textAlign: TextAlign.center),
                  Text(movie.voteCount.toString(), textAlign: TextAlign.center,)
                  
                ] 
              ),
              
            ],
          ),
          Padding(padding: EdgeInsetsGeometry.all(8)),

          Padding(padding: EdgeInsetsGeometry.all(8)),
        ],
      )
    )));
  }
}


