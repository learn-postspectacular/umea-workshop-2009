import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;

import processing.core.PApplet;
import toxi.data.feeds.RSSFeed;
import toxi.data.feeds.RSSItem;

public class HelloEclipse extends PApplet {

	private RSSFeed feed;

	public void setup() {
		size(200, 200);
		loadRSS("http://twitter.com/statuses/user_timeline/87382538.rss");
		println(feed.channel.title);
		println("old skool version--------------------");
		for(int i=0; i<feed.channel.items.size(); i++) {
			RSSItem item=(RSSItem)feed.channel.items.get(i);
			println(item.title);			
		}
		println("verbose version-----------------------");
		for(Iterator i = feed.channel.items.iterator(); i.hasNext();) {
			RSSItem item=(RSSItem)i.next();
			println(item.title);
		}
		println("new & concise-----------------------");
		for(RSSItem  i : feed.channel.items) {
			println(i.title);
		}
	}

	public void draw() {
		background(frameCount % 255);
	}

	public void loadRSS(String url) {
		JAXBContext context;
		try {
			context = JAXBContext.newInstance(RSSFeed.class);
			feed = (RSSFeed) context.createUnmarshaller().unmarshal(new URL(url));
		} catch (JAXBException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
