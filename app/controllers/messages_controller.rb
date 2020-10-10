class MessagesController < ApplicationController
  def index
    messages = Message.all.map do |message|
      {
        id: message.id,
        content: message.content,
        sender: {
          id: message.sender.id,
          type: message.sender.class.to_s,
          name: message.sender.name,
          phone_number: message.sender.phone_number
        },
        receiver: {
          id: message.receiver.id,
          type: message.receiver.class.to_s,
          name: message.receiver.name,
          phone_number: message.receiver.phone_number
        },
        created_at: message.created_at,
        updated_at: message.updated_at,
      }
    end

    render json: messages
  end

  def create
    message = Message.new(message_params)

    if message.save
      return render json: message, status: :ok
    end

    render json: message.errors, status: :unprocessable_entity
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_id, :sender_type, :receiver_id, :receiver_type)
  end
end
