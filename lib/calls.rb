class Calls
  attr_reader :client

  AVAYA_CALLS_ENDPOINT = ENV['AVAYA_CALLS_ENDPOINT'].freeze
  AVAYA_TOKEN = ENV['AVAYA_TOKEN'].freeze
  NODE_RED_DIALPLAN_URL = ENV['NODE_RED_DIALPLAN_URL'].freeze

  def initialize(client: HTTParty)
    @client = client
  end

  def computed_node_red_number(to)
    to = to.sub!('+', '')

    message = NODE_RED_DIALPLAN_URL + "?student=" + to

    return message
  end

  def send(from:, to:)
    options = {
      body: "From=+447537149365&To=#{from}&Url=#{computed_node_red_number(to)}&Method=GET",
      headers: { "Authorization": "Basic #{AVAYA_TOKEN}"}
    }

    client.post(AVAYA_CALLS_ENDPOINT, options)
  end
end
