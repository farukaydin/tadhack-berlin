class Sms
  attr_reader :client

  HUBRAUM_SMS_ENDPOINT = ENV['HUBRAUM_SMS_ENDPOINT'].freeze
  TADHACK_AUTHORIZATION_TOKEN = ENV['TADHACK_AUTHORIZATION_TOKEN'].freeze

  def initialize(client: HTTParty)
    @client = client
  end

  def send(message:, receiver:, sender: '+447537149365')
    options = { 
      body: "From=#{sender}&To=#{receiver}&Body=#{message}",
      headers: { "Authorization": TADHACK_AUTHORIZATION_TOKEN }
    }

    client.post(HUBRAUM_SMS_ENDPOINT, options)
  end
end
