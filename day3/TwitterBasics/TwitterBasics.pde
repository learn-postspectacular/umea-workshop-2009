Twitter twitter = new Twitter("ixdumea","$Hg*lM-2TaJ");

void setup() {
  size(100,100);
  //sendMessage("Hello world!");
  //getContactsTimeline();
  searchTwitter("umea");
}

void sendMessage(String message) {
  try{
    twitter4j.Status status = twitter.updateStatus(message);
    println("Successfully sent message: \"" + status.getText() + "\".");
  } 
  catch(TwitterException e) {
    println(e.getMessage());
  }
}

void getContactsTimeline() {
  try {
    java.util.List statuses = twitter.getFriendsTimeline();
    for (Iterator i=statuses.iterator(); i.hasNext();) {
      twitter4j.Status s=(twitter4j.Status)i.next();
      println(s.getUser().getName() + ":" + s.getText());
    }
  } 
  catch(TwitterException e) {
    println(e.getMessage());
  }
}

void searchTwitter(String searchQuery) {
  Query query = new Query(searchQuery);
  try {
    QueryResult result = twitter.search(query);
    println("hits:" + result.getTotal());
    for (Iterator i=result.getTweets().iterator(); i.hasNext();) {
      Tweet tweet =(Tweet)i.next();
      println(tweet.getFromUser() + ":" + tweet.getText());
    }
  } 
  catch(TwitterException e) {
    println(e.getMessage());
  }
}


