import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:kilo4/flashcard.dart';
import 'package:kilo4/flashcard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<FlashCard> _flashcards = [
    FlashCard(" What are two things you can never eat for breakfast?",
        "Lunch and Dinner"),
    FlashCard("What is always coming but never arrives? ", "Tomorrow"),
    FlashCard("What gets wetter the more it dries? ", "A towel"),
    FlashCard("What can be broken but never held? ", "A promise"),
    FlashCard("What word is spelled incorrectly in every single dictionary?",
        "ncorrectly"),
  ];

  int currentIndexOfFlashCards = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: FlipCard(
                front: FlashCardView(
                    text: _flashcards[currentIndexOfFlashCards].question),
                back: FlashCardView(
                    text: _flashcards[currentIndexOfFlashCards].answer),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white, shadowColor: Colors.red),
                    onPressed: showPreviousCard,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.skip_previous,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Prev",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: showNextCard,
                    child: Row(
                      children: const [
                        Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.skip_next,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      currentIndexOfFlashCards =
          (currentIndexOfFlashCards + 1 < _flashcards.length)
              ? currentIndexOfFlashCards + 1
              : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      currentIndexOfFlashCards = (currentIndexOfFlashCards - 1 >= 0)
          ? currentIndexOfFlashCards - 1
          : _flashcards.length - 1;
    });
  }
}
