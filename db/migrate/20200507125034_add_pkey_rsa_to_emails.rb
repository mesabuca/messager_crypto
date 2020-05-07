class AddPkeyRsaToEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :pkey_rsa, :boolean
  end
end
