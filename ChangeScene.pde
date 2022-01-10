class ChangeScene extends Runner {
  GameState s;
  ChangeScene(GameState s) {
    this.s = s;
  }
  void run() {
    changeScene(s);
  }
}
