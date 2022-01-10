class GridSpace {
 
  float x;
  float y;
  float w;
  float h;
  int type = 0;
  color colour = color(255,255,255);
  GridSpace(float x,float y,float w,float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }; //End the constructor

  boolean pointInBox(float mX,float mY,float bX,float bY,float bW,float bH) {
    return (mX > bX && mX < (bX+bW) && mY > bY && mY < (bY+bH));
  };

  void clickSquare(int player) {
    if (pointInBox(mouseX, mouseY, this.x, this.y, this.w, this.h)) {
      colour = color(255,0,0);
      if (type == 0) {
        if (input.mouseClicked) {
          type = player;
        }
      }
      
    } else {
      colour = color (255,255,255);
    }
  }
  
  void paint() {
    fill(colour);
    strokeWeight(4);
    rect(this.x,this.y, this.w, this.h);
    
    switch (type) {//draw symbole on grid space 
       case 1:
         strokeWeight(10);
         line(this.x, this.y, this.x+this.w, this.y+this.h);
         line(this.x+this.w, this.y, this.x, this.y+this.h);
         break;
         
       case 2:
         strokeWeight(10);
         ellipse(this.x+(this.w/2), this.y+(this.h/2), this.w, this.h);
         break;
    }  

  };//End paint

};
