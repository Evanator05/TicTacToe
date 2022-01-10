GameState scene;
Input input;
void setup() {
  size(1280,720);
  changeScene(new MainMenu());
  input = new Input();
};

void draw() {
  input.checkMousePressed();
  scene.run();
};

void mousePressed() {
};

GameState getScene() {
  return scene;
}

void changeScene(GameState s) {
  s.stateStart();
  scene = s;
  println("Changed Scene To " + s);
}
