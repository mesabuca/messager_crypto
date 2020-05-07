class AddVerifiedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :verified, :boolean, default: false
    add_column :users, :sms_code, :string
  end
end
