class TweetJob < ApplicationJob
  queue_as :default

  #lesson 34
  def perform(tweet)
    return if tweet.published?

    # Rescheduled a tweet to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
    # Do something later
  end
end
