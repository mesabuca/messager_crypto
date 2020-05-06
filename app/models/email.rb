class Email < ApplicationRecord
  attr_accessor :receiver_email, :aes_key, :check
  belongs_to :user
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  before_validation :set_receiver
  before_validation :word_analyzer
  before_validation :generate_check_sum, if: :check
  before_validation :aes_256_cbc

  private

  def aes_256_cbc
    return unless aes_key.present?

    cipher = OpenSSL::Cipher::AES.new(256, :CBC)
    cipher.encrypt
    cipher.key = Digest::SHA256.hexdigest(aes_key).first(32)
    self.iv = SecureRandom.base58(16)
    cipher.iv = self.iv
    text = salty_content(self.content)
    self.content = cipher.update(text).force_encoding('ISO-8859-1').encode('UTF-8').gsub("\u0000", "null")
  end

  def generate_check_sum
    self.check_sum = Digest::SHA256.hexdigest(self.content) unless self.id.present?
  end

  def salty_content(content)
    content + '-divider-' + SecureRandom.base58(50)
  end

  def set_receiver
    self.receiver_id = User.find_by(email: receiver_email).id
  end

  def word_analyzer
    words = self.content.gsub(/[()-+.,:;'"]/, '').split(' ')
    words_hash = words.group_by(&:itself).transform_values(&:count)
    self.word_analytics = words_hash
  end
end
