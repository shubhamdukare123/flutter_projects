import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class QuizAppUI extends StatefulWidget {
  const QuizAppUI({super.key});

  @override
  State createState() {
    return _QuizAppUIState();
  }
}

class _QuizAppUIState extends State {
  bool questionScreen = true;
  int qIndex = 0;
  int cQuestionCount = 0;
  int selectedIndex = -1;

  List<Map> allQuestions = [
    {
      "question": "Who is the founder of Boat?",
      "options": [
        "Ashneer Grover",
        "Aman Gupta",
        "Namita Thapar",
        "Anupam Mittal"
      ],
      "answer": 1
    },
    {
      "question": "Who is the founder of Lenskart?",
      "options": [
        "Peyush Bansal",
        "Ashneer Grover",
        "Anupam Mittal",
        "Namita Thapar"
      ],
      "answer": 0
    },
    {
      "question": "Who is the founder of Linux?",
      "options": [
        "Dennis Ritchie",
        "James Gosling",
        "Guido van Russom",
        "Linus Torvalds"
      ],
      "answer": 3
    },
    {
      "question": "Who is the founder of Java?",
      "options": [
        "Dennis Ritchie",
        "Guido Van Russom",
        "James Gosling",
        "Linus Torvalds"
      ],
      "answer": 2,
    },
    {
      "question": "Who is the founder of Core2web?",
      "options": [
        "Shashi Bagal",
        "Guido Van Russom",
        "Ashneer Grover",
        "Sundar Pichai"
      ],
      "answer": 0
    }
  ];

  MaterialStateProperty<Color?> giveColor(int btnIndex) {
    if (selectedIndex != -1) {
      if (btnIndex == allQuestions[qIndex]["answer"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedIndex == btnIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.grey);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.grey);
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text(
            "QuizApp",
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w800,
              fontSize: 30,
              color: Colors.red,
            ),
          ),
          backgroundColor: Colors.yellow,
        ),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                "Question : ",
                style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              Text("${qIndex + 1}/${allQuestions.length}",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                  ))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 380,
              child: Text(allQuestions[qIndex]["question"],
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500, fontSize: 25)),
            ),
          ]),
          
          const SizedBox(
            height: 20
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                if (selectedIndex == -1) {
                  selectedIndex = 0;
                  if (selectedIndex == allQuestions[qIndex]["answer"]) {
                    cQuestionCount++;
                  }
                }
                setState(() {});
              },
              style: ButtonStyle(
                backgroundColor: giveColor(0),
                
              ),
              child: Text(allQuestions[qIndex]["options"][0],
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20)),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                if (selectedIndex == -1) {
                  selectedIndex = 1;
                  if (selectedIndex == allQuestions[qIndex]["answer"]) {
                    cQuestionCount++;
                  }
                  setState(() {});
                }
              },
              style: ButtonStyle(
                backgroundColor: giveColor(1),
              ),
              child: Text(allQuestions[qIndex]["options"][1],
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20)),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                if (selectedIndex == -1) {
                  setState(() {
                    selectedIndex = 2;
                    if (selectedIndex == allQuestions[qIndex]["answer"]) {
                      cQuestionCount++;
                    }
                  });
                }
              },
              style: ButtonStyle(
                backgroundColor: giveColor(2),
              ),
              child: Text(allQuestions[qIndex]["options"][2],
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20)),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                if (selectedIndex == -1) {
                  setState(() {
                    selectedIndex = 3;
                    if (selectedIndex == allQuestions[qIndex]["answer"]) {
                      cQuestionCount++;
                    }
                  });
                }
              },
              style: ButtonStyle(
                backgroundColor: giveColor(3),
              ),
              child: Text(allQuestions[qIndex]["options"][3],
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20)),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (qIndex < allQuestions.length - 1 && selectedIndex != -1) {
                qIndex++;
                selectedIndex = -1;
              } else if (qIndex == allQuestions.length - 1) {
                questionScreen = false;
              } else {}
              setState(() {});
            },
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.redAccent,
            child:  Text("Next",
              style: GoogleFonts.quicksand(
				fontSize : 20,
				fontWeight: FontWeight.w600
			  ),
            ),
      )
	  );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text(
            "QuizApp",
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w800,
              fontSize: 30,
              color: Colors.red,
            ),
          ),
          backgroundColor: Colors.yellow,
        ),

        body: Column(
          children:[
            const SizedBox(
              height: 70,
            ),

            Image.network("https://purepng.com/public/uploads/medium/purepng.com-gold-cup-trophygolden-cupgoldtrophymedal-1421526534849oyutg.png",
            ),

             Text("Congratulations,",
              style:  GoogleFonts.quicksand(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                color: Colors.orange
              ),
            ),

            Text("Your score is $cQuestionCount/${allQuestions.length}",
              style:  GoogleFonts.quicksand(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.amber,
                decoration: TextDecoration.underline,
              )
            ),

            const SizedBox(
              height: 50,
            ),

            ElevatedButton(
              onPressed: () => setState((){
                qIndex = 0;
                cQuestionCount = 0;
                questionScreen = true;
                selectedIndex = -1;
              }),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.yellow)
              ),
              child:  Text("Reset",
                style: GoogleFonts.quicksand(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color : Colors.orange
                ),
              )
            )

          ]
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
