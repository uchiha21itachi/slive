# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '388489'
Pusher.key = '1980dcfefbb9558eb6ee'
Pusher.secret = 'd28839335fcd37234756'
Pusher.cluster = 'ap2'
Pusher.logger = Rails.logger
Pusher.encrypted = true

