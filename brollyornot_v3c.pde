/*
 * Example inspired by the earlier tutorial by blprnt
 * See http://twitter4j.org/javadoc/ for the in-depth
 * documentation about the many thing you can do with
 * the twitter4j library
 */
import gohai.simpletweet.*;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.TwitterException;
import twitter4j.User;

SimpleTweet simpletweet;
ArrayList<Status> tweets;

void setup() {
  size(500, 500);
  frameRate(0.5);
  background(10,10,10);
  simpletweet = new SimpleTweet(this);

  /*
   * Create a new Twitter app on https://apps.twitter.com/
   * then go to the tab "Keys and Access Tokens"
   * copy the consumer key and secret and fill the values in below
   * click the button to generate the access tokens for your account
   * copy and paste those values as well below
   */
  simpletweet.setOAuthConsumerKey("INSERT OWN KEY HERE");
  simpletweet.setOAuthConsumerSecret("INSERT OWN KEY HERE");
  simpletweet.setOAuthAccessToken("INSERT OWN KEY HERE");
  simpletweet.setOAuthAccessTokenSecret("INSERT OWN KEY HERE");

  //tweets = search("#rain" + "#melbourne");
  tweets = search("geocode:-37.813017,144.961382,10km, raining OR brolly -song -specials -sydney -noah -traides -winners -tips -invasion -death -new -nba2k17 since:2017-10-09");
}

 void draw() {
  background(10,10,10);
  Status current = tweets.get(frameCount % tweets.size());
  String message = current.getText();
  User user = current.getUser();
  String username = user.getScreenName();
  text(message + "\n" + "by @" + username, 0, height/2);
} 


ArrayList<Status> search(String keyword) {
  // request 10 results
  Query query = new Query(keyword);
  query.setCount(10);

  try {
    QueryResult result = simpletweet.twitter.search(query);
    ArrayList<Status> tweets = (ArrayList)result.getTweets();
    // return an ArrayList of Status objects
   return tweets;
  } catch (TwitterException e) {
    //println(e.getMessage());
    return new ArrayList<Status>();
  }
}
