void sendMessage(String message) {
  try{
    twitter4j.Status status = twitter.updateStatus(message);
    println("Successfully sent message: \"" + message + "\".");
  }
  catch(TwitterException e) {
    println(e.getMessage());
  }
}
