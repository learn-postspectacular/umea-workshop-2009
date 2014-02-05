/**
 * The SoundPlayer class is a MediaPlayer for playing back
 * WAV files using:
 * 
 * toxiclibs audioutils (http://toxiclibs.org)
 * JOAL (http://joal.dev.java.net)
 */
class SoundPlayer implements MediaPlayer {

  JOALUtil audio;
  ArrayList sources=new ArrayList();

  int trackID;

  SoundPlayer() {
    audio = JOALUtil.getInstance();
    audio.init();
  }

  void addItem(String fileName) {
    fileName=dataPath(fileName);
    sources.add(audio.generateSourceFromFile(fileName));
  }

  void playItem() {
    AudioSource s=(AudioSource)sources.get(trackID);
    s.play();
  }

  void skipItem() {
    trackID=(trackID+1) % sources.size();
    playItem();
  }

  void update() {

  }
}



