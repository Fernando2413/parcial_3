import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_3/presentation/blocs/cubit/movie_list_cubit.dart';
import 'package:parcial_3/presentation/blocs/cubit/movie_list_state.dart';
import 'package:parcial_3/presentation/widgets/error_display.dart';
import 'package:parcial_3/presentation/widgets/network_image_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieListCubit()..getData(''),
      child: HomeView(),
    );
  }
}
class HomeView extends StatelessWidget {
  HomeView({super.key});
  final queryController = TextEditingController();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text('Movies'), 
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
        body: Center(
          child: BlocBuilder<MovieListCubit, MovieListState>(
            builder: (context, state) {
              if (state is Loading) {
                return const CircularProgressIndicator();
              } else if (state is Success && state.data.isNotEmpty) {
                return Column(
                  children: [
                    TextFormField(controller: queryController,),
                    ElevatedButton(
                      onPressed: () {
                        context.read<MovieListCubit>().getData(queryController.text);
                      },
                      style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width - 20, 40)),
                        backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 192, 255, 192)),
                        foregroundColor: WidgetStatePropertyAll(Colors.black)
                      ),
                      child: Text('Search'),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsetsGeometry.all(2),
                            child: GestureDetector(
                            onTap: () {
                              context.pushNamed('details', extra: state.data[index]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(255, 192, 255, 192),
                              ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 64,
                                      child: AspectRatio(
                                        aspectRatio: 16/9,
                                        child: NetworkImageBuilder().build(context, state.data[index].posterUrl),
                                     ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2),
                                      child: Table(
                                        children: [
                                          TableRow(children: [Text(state.data[index].title, style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, ), ] ),
                                          TableRow(children: [Text('Rating: ${state.data[index].voteAverage}', overflow: TextOverflow.ellipsis, ),])
                                        ],
                                      )
                                    )
                                  ],
                                )
                              ),
                            )
                          );
                        },
                      ),
                    )
                  ],
                );
              } else if (state is Error) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ErrorDisplay(errorDetails: state.message).build(context),
                    ElevatedButton(
                    onPressed: () {
                      context.read<MovieListCubit>().getData('');
                    },
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(160, 40)),
                      backgroundColor: WidgetStatePropertyAll(Colors.red[300],),
                      foregroundColor: WidgetStatePropertyAll(Colors.black)
                    ),
                    child: Text('Return'),
                  ),
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  const Text('No Items were found'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MovieListCubit>().getData('');
                    },
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(120, 40)),
                      backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 192, 255, 192)),
                      foregroundColor: WidgetStatePropertyAll(Colors.black)
                    ),
                    child: Text('Return'),
                  ),
                ]          
              );
            },
          ),
        ),
    );
  }
}