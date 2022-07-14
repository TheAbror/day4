# day4

<img width="1440" alt="image" src="https://user-images.githubusercontent.com/60324587/178905008-f7eb5aa4-8f40-4979-a6fe-2939c85d26a9.png">




```
 List<FlashCard> _flashcards = [
    FlashCard(" What are two things you can never eat for breakfast?",
        "Lunch and Dinner"),
    FlashCard("What is always coming but never arrives? ", "Tomorrow"),
    FlashCard("What gets wetter the more it dries? ", "A towel"),
    FlashCard("What can be broken but never held? ", "A promise"),
    FlashCard("What word is spelled incorrectly in every single dictionary?",
        "ncorrectly"),
  ];
```
```
class FlashCard {
  final String question;
  final String answer;

  FlashCard(this.question, this.answer);
}

```

```
FlipCard(
                front: FlashCardView(
                    text: _flashcards[currentIndexOfFlashCards].question),
                back: FlashCardView(
                    text: _flashcards[currentIndexOfFlashCards].answer),
              ),
```

```
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
```







### border -> borderRadius: BorderRadius.circular10()
```
decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.white,
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.5),
                   spreadRadius: 5,
                   blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                 ),
               ],
               ),
```
