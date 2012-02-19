class AddOriginalTweetIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :original_tweet_id, :integer

  end
end
