before do
  request.body.rewind
  @request_payload = JSON.parse request.body.read
end

post '/github_webhooks' do
  p @request_payload
  GithubConnect::Webhook.new(env['HTTP_X_GITHUB_EVENT'], @request_payload).handle
  status 204
  body ''
end
