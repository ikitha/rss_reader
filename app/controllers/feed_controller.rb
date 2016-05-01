class FeedController < ApplicationController
  before_action :find_user, only: [:index, :bookmark, :bookmarks]

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
    @entry = Entry.find(feed_params[:entry_id])
    unless @user.entries.include? @entry
      @user.entries << @entry
    end
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def bookmarks
    @entries = @user.entries.order(:published_at => 'desc')
  end

  private
    def feed_params
      params.permit(:entry_id, :user_id, :id)
    end

    def find_user
      @user = User.find(params[:id])
    end

end
