class AddMessageTypeAndAudioUrlToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :message_type, :integer, default: 0
    add_column :messages, :audio_url, :string
  end
end
