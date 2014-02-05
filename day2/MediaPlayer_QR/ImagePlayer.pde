class ImagePlayer implements MediaPlayer {
  
  ArrayList images=new ArrayList();
  
  int imageID;
  
  ImagePlayer() {
    
  }
  
  void addItem(String fileName) {
    PImage img=loadImage(fileName);
    images.add(img);
  }
  
  void playItem() {
    
  }

  void skipItem() {
    imageID=(imageID+1) % images.size();
  }
  
  void update() {
    image((PImage)images.get(imageID),0,0);
  }
}
