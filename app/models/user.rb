class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_emails, class_name: 'Email', foreign_key: 'user_id'
  has_many :received_emails, class_name: 'Email', foreign_key: 'receiver_id'
end
