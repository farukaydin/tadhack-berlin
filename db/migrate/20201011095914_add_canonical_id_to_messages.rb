class AddCanonicalIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :canonical_id, :string
  end
end
