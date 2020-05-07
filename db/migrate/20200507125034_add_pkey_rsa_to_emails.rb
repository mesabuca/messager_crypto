class AddPkeyRsaToEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :pkey_rsa, :boolean
    add_column :emails, :content_sign, :text
    add_column :emails, :check_sum_sign, :text
  end
end
