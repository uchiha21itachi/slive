class LivemessageJob < ApplicationJob
  queue_as :critical

  def perform(token, json)
     Pusher.trigger("event-#{token}", 'livemessage', json)
  end
end