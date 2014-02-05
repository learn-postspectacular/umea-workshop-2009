class TextButton extends Button {
  
  String label;
  
  TextButton(Vec2D pos, float radius, String txt) {
    super(pos,radius);
    label=txt;
  }
  
  void render() {
    super.render();
    // draw label with the inverted color
    fill(isRollover ? colOff : colOn);
    textAlign(CENTER);
    text(label,pos.x,pos.y+5);
  }
  
}
