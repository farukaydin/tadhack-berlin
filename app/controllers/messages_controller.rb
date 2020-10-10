class MessagesController < ApplicationController
  def index
    render json: Message.all
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
