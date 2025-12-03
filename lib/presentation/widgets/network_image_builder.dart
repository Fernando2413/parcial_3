import 'package:flutter/material.dart';

class NetworkImageBuilder {
  
  Widget build(BuildContext context, String src){
    return Image.network(
      errorBuilder: (context, error, stacktrace){
        return NetworkImageBuilder().build(context, "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg");
      },                                  
      src,
      fit: BoxFit.contain,
    );
  }
}