import 'dart:math';
import 'package:flutter/material.dart';
import 'package:number_guessing_page/pages/successful_page.dart';
import 'loser_page.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int randomNumber = 0;
  int userGuess = 0;
  int guessChances = 3;


  @override
  void initState() {
    super.initState();
    generateRandomNumber();
  }

  void generateRandomNumber() {
    final random = Random();
    randomNumber = random.nextInt(100);
  }

  void checkGuess() {
    if (userGuess == randomNumber) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessfulPage(),
        ),
      );
    }
    else {
      setState(() {
        guessChances--;
      });

      if (guessChances == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:(context) => LoserPage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Guessing Game'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Image.asset('assets/images/PinClipart.com_vocab-clipart_5378142.png',height: 200,),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text('Guess the Number',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),),
                Text('$randomNumber'),

                SizedBox(height: 20,),
                guessChances > 0
                    ? Container(
                      child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                      setState(() {
                        userGuess = int.tryParse(value) ?? -1;
                      });
                  },

                ),
                    )
                    : Text('No more chances left',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),),
                SizedBox(height: 20,),

                ElevatedButton(onPressed: guessChances > 0 ? checkGuess : null,
                  child: Text('Submit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 20,),
                Text('Chances left: $guessChances',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
