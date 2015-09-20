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
    Project.create!(
      name:           @params['repository']['name'],
      github_repo_id: @params['repository']['id']
    )
  end

  def handle_member
    TrelloConnect.add_user_to_board!(
      github_user_id: @params['member']['id'],
      github_repo_id: @params['repository']['id']
    )
  end

end