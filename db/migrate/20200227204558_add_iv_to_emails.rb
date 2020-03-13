class AddIvToEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :iv, :string
  end
end
