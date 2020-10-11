class ReceivedController < ApplicationController
  def sms
    sender_number = "+" + params[:from]
    receiver_number = params[:to]
    content = params[:body]

    sender = Student.find_by(phone_number: sender_number)
    receiver = Teacher.first
  
    m = Message.new(sender: sender, receiver: receiver, content: content)
    m.send(:create_without_callbacks)
  end

  def calls
  end
end
