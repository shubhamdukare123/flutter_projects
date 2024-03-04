import "package:flutter/material.dart";
import "quiz_app_ui.dart";
void main(){
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget{
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: QuizAppUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}
