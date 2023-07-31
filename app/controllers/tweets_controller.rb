class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index
        if params[:search] != nil && params[:search] != ''
          #部分検索かつ複数検索
          search = params[:search]
          @tweets = Tweet.joins(:user).where("body LIKE ? OR shop LIKE ? OR place LIKE ? OR food LIKE ? OR price LIKE ? OR name LIKE ?","%#{search}%", "%#{search}%","%#{search}%", "%#{search}%","%#{search}%","%#{search}%").page(params[:page]).per(6)
        else
          @tweets = Tweet.all.page(params[:page]).per(6)
        end
    end

    def new
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end

    private
     def tweet_params
        params.require(:tweet).permit(:body, :shop, :place, :food, :price, :created_at, :image, :taste, :overall, :originality, :wait)
     end
end
