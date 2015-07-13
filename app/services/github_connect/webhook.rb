class GithubConnect::Webhook

  attr_reader :event

  def initialize(params)
    @params = params
    @event  = @params[:event]
  end

end