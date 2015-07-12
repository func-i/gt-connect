Trello.configure do |config|

  # must be admin
  config.developer_public_key = ENV['TRELLO_PUBLIC_KEY']
  config.member_token         = ENV['TRELLO_MEMBER_TOKEN']
end