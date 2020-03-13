class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :title
      t.integer :receiver_id
      t.text :content
      t.references :user

      t.timestamps
    end
  end
end
