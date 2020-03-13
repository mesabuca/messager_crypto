class AddCheckSumToEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :check_sum, :string
  end
end
