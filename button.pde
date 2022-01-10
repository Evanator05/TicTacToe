class Button {
  float x;
  float y;
  float w;
  float h;
  String text;
  color colour = color(255,0,0);
  int number = 0;
  float timerReset = 5;
  float timer = timerReset;
  TextBox textBox;
  
  Runner function;
  Button(float x,float y,float w,float h, String text, Runner function) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.function = function;
    this.textBox = new TextBox(this.text, this.x, this.y, this.w, this.h);
    this.textBox.calculateFontSize();
    
  }; //End the constructor

  boolean pointInBox(float mX,float mY,float bX,float bY,float bW,float bH) {
    return (mX > bX && mX < (bX+bW) && mY > bY && mY < (bY+bH));
  };

  boolean mouseInBox() {
    boolean isIn = pointInBox(mouseX, mouseY, this.x, this.y, this.w, this.h);
    if (isIn) {
      if (input.mouseClicked) {
        timer -= .1;
        if (timer <= 0) {
          function.run();
          timer = timerReset;
          number++;
         }
      } else {
        timer = 0;
      };
    };
    return isIn;
  };//End mouseInBox
  void paint() {
    fill(colour);
    rect(this.x,this.y, this.w, this.h);
    textBox.drawText();
  };//End paint
};
