class MainMenu extends GameState {
  
  Button startButton;
  TextBox text;
  
  void stateStart() {
    startButton = new Button(width*1/3, height*1/3, width*1/3, height*1/3, "Play", new ChangeScene(new CountDown()));
    text = new TextBox("TicTacToe", width*1/5, 0, width*2/3, height*1/3);
    text.calculateFontSize();
  }
  
  void run() {
    fill(0);
    rect(0,0,width,height);
    startButton.paint();
    startButton.mouseInBox();
    text.drawText();
  }
  
}
