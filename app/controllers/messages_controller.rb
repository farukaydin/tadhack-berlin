class MessagesController < ApplicationController
  def index
    messages = Message.all.map do |message|
      {
        id: message.id,
        content: message.content,
        message_type: message.message_type,
        audio_url: message.audio_url,
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
    if(params['message']['receiver_id'].size > 1)
      receiver_ids = params['message']['receiver_id']

      Message.save_batch(sender_id: message_params[:sender_id], receiver_ids: receiver_ids, message: message_params[:content])

      return head :ok
    end

    receiver_id = params['message']['receiver_id'].first
    message = Message.new(message_params.merge!(receiver_id: receiver_id))

    if message.save
      return render json: message, status: :ok
    end

    render json: message.errors, status: :unprocessable_entity
  end

  private

  def message_params
    params.require(:message).permit(:content, :receiver_id, :receiver_type, :sender_id, :sender_type)
  end
end
