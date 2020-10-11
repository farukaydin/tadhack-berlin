class ReceivedController < ApplicationController
  def sms
    sender_number = "+" + params[:from]
    receiver_number = params[:to]
    content = params[:body]

    sender = Student.find_by(phone_number: sender_number)
    receiver = Teacher.first
  
    Message.create(sender: sender, receiver: receiver, content: content)
  end

  def calls
  end
end
