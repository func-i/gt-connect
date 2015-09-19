class GithubConnect::Webhook

  include TrelloConnect

  attr_reader :event_name

  def initialize(event_name, params)
    @params     = params
    @event_name = event_name
  end

  def handle
    send "handle_#{@event_name}"
  end

  protected

  def handle_repository
    init_board! @params['repository']['name']
  end

end