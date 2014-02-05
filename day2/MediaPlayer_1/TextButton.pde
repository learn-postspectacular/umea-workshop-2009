class TextButton extends Button {
  
  String label;
  
  TextButton(Vec2D pos, float radius, String txt) {
    super(pos,radius);
    label=txt;
  }
  
  void render() {
    super.render();
    text(label,pos.x,pos.y+radius+30);
  }
  
}
