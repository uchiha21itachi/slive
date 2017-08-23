# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '388467'
Pusher.key = '10bb9323b98217d7b03c'
Pusher.secret = '9fe6ccc71b80653dbd46'
Pusher.cluster = 'us2'
Pusher.logger = Rails.logger
Pusher.encrypted = true
