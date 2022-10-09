import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  late String message;
  late List<String> gameState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];

      this.message = "";
    });
  }

  //Reset the  game
  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];

      this.message = "";
    });
  }

  //get the images
  getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  //playgame method
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = '${gameState[0]} Wins';
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[3] == gameState[5])) {
      setState(() {
        this.message = '${gameState[3]} Wins ';
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[6] == gameState[8])) {
      setState(() {
        this.message = '${gameState[6]} Wins ';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[0] == gameState[6])) {
      setState(() {
        this.message = '${gameState[0]} Wins ';
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[1] == gameState[7])) {
      setState(() {
        this.message = '${gameState[1]} Wins ';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[2] == gameState[8])) {
      setState(() {
        this.message = '${gameState[2]} Wins ';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[0] == gameState[8])) {
      setState(() {
        this.message = '${gameState[0]} Wins ';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[2] == gameState[6])) {
      setState(() {
        this.message = '${gameState[2]} Wins ';
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = 'Game draw';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: this.gameState.length,
                  itemBuilder: (context, i) => SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: MaterialButton(
                          onPressed: () {
                            this.playGame(i);
                          },
                          child: Image(image: this.getImage(this.gameState[i])),
                        ),
                      ))),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(this.message,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      MaterialButton(
                        color: Colors.purple , 
                        minWidth: 300.0,
                        height: 50.0,
                        child: Text('Rest Game',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),),

                        onPressed: (){
                        this.resetGame() ;
                      }),

                      Container(
                        padding: EdgeInsets.all(50.0),
                      )
        ],
      ),
    );
  }
}
