class ReceivedController < ApplicationController
  def sms
    sender_number = params[:from]
    receiver_number = params[:to]
    content = params[:body]

    puts "sender number: #{sender_number}"
    puts "receiver number: #{receiver_number}"
    puts "message content: #{content}"

    # student = Student.find_by(phone_number: sender_number)
    # Message.create(sender)
  end

  def calls
  end
end
