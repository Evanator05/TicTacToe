class Play extends GameState {
  ArrayList<GridSpace> buttons = new ArrayList<GridSpace>();
  int xWidth = 3, yHeight = 3;
  int turn = 0;
  int player = 1;
  int score[] = {0,0};
  TextBox scoreBoard;
  
  void stateStart() {
    float tileSize = ((width/xWidth) * int((width<height))) + ((height/yHeight) * int((width>height)));//set tileSize
  
    //Make TicTacToe Grid
    for (int x = 0; x < xWidth; x++) {//Create tiles
      for (int y = 0; y < yHeight; y++) {
        buttons.add(new GridSpace(tileSize*x, tileSize*y, tileSize, tileSize));
      }
    };
  
    //Make menu text
    scoreBoard = new TextBox("X: " + score[0] + " O: " + score[1], tileSize*xWidth, 0, width-tileSize*xWidth, height*1/3);
    scoreBoard.calculateFontSize();
  }
  int getTurn() {// Returns the turn number(either 1 or 2)
    return ceil(turn%2+1);
  }
  
  void resetScene() {
    buttons.clear();
    float tileSize = ((width/xWidth) * int((width<height))) + ((height/yHeight) * int((width>height)));//set tileSize
  
    //Make TicTacToe Grid
    for (int x = 0; x < xWidth; x++) {//Create tiles
      for (int y = 0; y < yHeight; y++) {
        buttons.add(new GridSpace(tileSize*x, tileSize*y, tileSize, tileSize));
      }
    };
  };

  GridSpace getSpace(int x, int y) {
    return buttons.get((x-1) + (3*(y-1)));
  }
  
  void checkWin() {
    for (int x = 0; x < 3; x++) {
      int numberOfWork[] ={0,0};
      for (int y = 0; y < 3; y++) {      
        int playerState = getSpace(x+1, y+1).type;      
        if (playerState != 0) {
          numberOfWork[playerState-1] += 1;
        }//End player state    
      }
      for (int i = 0; i < 2; i++) {
        if (numberOfWork[i] >=3) {
          score[i] += 1;
          resetScene();
        }
      }//Add score to each player
      
    }//End of col check

    for (int y = 0; y < 3; y++) {
      int numberOfWork[] ={0,0};
      for (int x = 0; x < 3; x++) {
        int playerState = getSpace(x+1,y+1).type;
        if (playerState != 0) {
          numberOfWork[playerState-1] += 1;
        }//End player state
      }

      for (int i = 0; i < 2; i++) {
        if (numberOfWork[i] >=3) {
          score[i] += 1;
          resetScene();
        }
      }//Add score to each player
    }//End of row check
    
    int numberOfWork[] ={0,0};
    for (int i = 0; i < 9; i+=4) {
      int playerState = buttons.get(i).type;
      if (playerState != 0) {
          numberOfWork[playerState-1] += 1;
      }//End player state
      
    }
    for (int i = 0; i < 2; i++) {
        if (numberOfWork[i] >=3) {
          score[i] += 1;
          resetScene();
        }
      }//Add score to each player
  
    numberOfWork[0] = 0;
    numberOfWork[1] = 0;
    for (int i = 2; i < 8; i+=2) {
      int playerState = buttons.get(i).type;
      if (playerState != 0) {
          numberOfWork[playerState-1] += 1;
      }//End player state
      
    }
    for (int i = 0; i < 2; i++) {
        if (numberOfWork[i] >=3) {
          score[i] += 1;
          resetScene();
        }
      }//Add score to each player
    
  }//End of checkWin
  
  void updateScoreBoard() {
    scoreBoard.text= "X: " + score[0] + " O: " + score[1];
  }
  
  void run() {
      //Draw background
      strokeWeight(0);
      fill(0);
      rect(0,0,width,height);
  
      for (int i = 0; i < buttons.size(); i++) {  //Check interactions and draw tiles
         player = getTurn();
         int preTurn = buttons.get(i).type;
         buttons.get(i).clickSquare(player);
         if (preTurn != buttons.get(i).type) {
           turn += 1;
           checkWin();
         }
         buttons.get(i).paint();
      };
    updateScoreBoard();
    scoreBoard.drawText();
  }
  
}
