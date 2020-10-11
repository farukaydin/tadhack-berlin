class Calls
  attr_reader :client

  AVAYA_CALLS_ENDPOINT = 'https://api.zang.io/v2/Accounts/AC777c3e3222b41c420f0f41ff8f1363f1/Calls.json'.freeze
  NODE_RED_DIALPLAN_URL = 'https://nodered.aws.automat-berlin.net/th2020call'.freeze

  def initialize(client: HTTParty)
    @client = client
  end

  def send(from:, to:)
    options = {
      body: "From=#{from}&To=#{to}&Url=#{NODE_RED_DIALPLAN_URL}",
      headers: { "Authorization": "AC777c3e3222b41c420f0f41ff8f1363f1:506411d435724d14b6319040ec044e84" }
    }

    client.get(AVAYA_CALLS_ENDPOINT, options)
  end
end
