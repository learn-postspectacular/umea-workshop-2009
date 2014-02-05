/**This interface defines the minimum functionality
 * we expect any media player to have.
 */
public interface MediaPlayer {

  // adds another media item from the given file
  void addItem(String file);
  
  // called to trigger next media item 
  void playItem();

  // called to skip current and trigger next item
  void skipItem();

  // called from main draw() method
  void update();
}


