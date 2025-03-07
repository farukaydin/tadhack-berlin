class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :sender, polymorphic: true
      t.references :receiver, polymorphic: true

      t.timestamps
    end
  end
end
