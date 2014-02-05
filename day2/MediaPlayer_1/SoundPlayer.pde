class SoundPlayer implements MediaPlayer {
  
  JOALUtil audioSys;
  AudioSource[] sources=new AudioSource[3];
  
  int trackID;
  
  SoundPlayer() {
    audioSys = JOALUtil.getInstance();
    audioSys.init();
    for(int i=0; i<sources.length; i++) {
      String fileName=dataPath("sound"+i+".wav");
      sources[i]=audioSys.generateSourceFromFile(fileName);
    }
  }
  
  void playItem() {
    sources[trackID].play();
  }
  
  void skipItem() {
    trackID=(trackID+1) % sources.length;
    playItem();
  }
  
  void update() {
    
  }
}
