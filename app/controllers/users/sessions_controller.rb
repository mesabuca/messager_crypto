# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :user_verified?

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    current_user.update(sms_code: SecureRandom.base58(6))
    puts '# # # # # # # # # # # # # # # # # # # # # # # # '
    puts "Sms Code : #{current_user.sms_code}"
    puts '# # # # # # # # # # # # # # # # # # # # # # # # '
    super
  end

  # DELETE /resource/sign_out
  def destroy
    current_user.update(sms_verified?: false)
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
