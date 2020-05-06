class AddWordAnalyticsToEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :word_analytics, :jsonb
  end
end
