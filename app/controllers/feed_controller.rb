class FeedController < ApplicationController

  def index
    Entry.update_from_feed("https://www.reddit.com/r/technology/.rss")
  end

  def entries
    Entry.update_from_feed("https://www.reddit.com/r/technology/.rss")
  end

  def bookmark
  end

  def bookmarks
  end

end
