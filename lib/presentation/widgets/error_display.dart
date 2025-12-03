import 'package:flutter/material.dart';

class ErrorDisplay {
  final String errorDetails;

  const ErrorDisplay({required this.errorDetails});
  Widget build(BuildContext context){
    return Center(
      child: SizedBox(
        height: 200,
        child: Card( 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.red[100],
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsGeometry.all(8),
                alignment: AlignmentGeometry.topCenter,
                decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12), 
                    topRight: Radius.circular(12)
                  ), 
                ),
                child: Text('Hmmm... it seems that an error has ocurred', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Padding(padding: EdgeInsetsGeometry.all(8)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('The error details area as follows:'),
                      Padding(padding: EdgeInsetsGeometry.all(8)),
                      Text(errorDetails)
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}