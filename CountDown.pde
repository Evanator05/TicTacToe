class CountDown extends GameState {
  
  TextBox text;
  float timer = 3 * 60;
  
  void stateStart() {
    text = new TextBox(str(ceil(timer/60)),0,0,width,height);
  }
  
  void run() {
    timer -= 1;
    fill(0);
    rect(0,0,width, height);
    text.text = str(ceil(timer/60));
    text.drawText();
    if (timer < 0) {
      changeScene(new Play());
    }
  }

}
