import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget{
  const LoadingWidget ({super.key});

  @override
  Widget build(BuildContext context) {
   return const Center(
      child: CircularProgressIndicator(value: null),
    );
  }
  
} 