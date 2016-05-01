class FeedController < ApplicationController

  def index
    Entry.update_from_feed("https://www.reddit.com/r/technology/.rss")
  end

  def entries
    Entry.update_from_feed("https://www.reddit.com/r/technology/.rss")
    @entries = Entry.all.limit(10).order(:published_at => 'desc')
    respond_to do |format|
      format.json { render json: {entries: @entries}, status: :ok }
    end
  end

  def bookmark
  end

  def bookmarks
  end

end
