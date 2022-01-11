class Input {
  boolean mouseClicked = false;
  boolean previous = false;
  
  void checkMousePressed() {
    if (mousePressed) {
      if (!previous) {
        mouseClicked = true;
        previous = true;
      } else {
        mouseClicked = false;
      }
    } else {
      mouseClicked = false;
      previous = false;
    }

  }
  
}
