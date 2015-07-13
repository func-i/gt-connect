class GithubConnect::Webhook

  attr_reader :event_name

  def initialize(event_name, params)
    @params     = params
    @event_name = event_name
  end

  def handle
    send "handle_#@event_name}"
  end

  protected

  def handle_repository
    name = @params[:repository][:name]
    TrelloConnect.create_board name, 'created via gt-connect'
  end

end