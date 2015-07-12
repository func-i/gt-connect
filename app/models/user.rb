class User < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :trello_token, :trello_public_key

  def trello_connect
    thread = Thread.new { yield(trello_client) }
    response = thread.value
    Thread.kill thread

    return response
  end

  protected

  def trello_client
    @trello_client ||= Trello::Client.new(developer_public_key: trello_public_key, member_token: trello_token)
  end

end