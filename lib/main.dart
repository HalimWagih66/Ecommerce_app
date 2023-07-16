import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/utils/observer.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main(){
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}