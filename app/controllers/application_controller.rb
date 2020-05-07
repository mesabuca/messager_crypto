class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :user_verified?, if: :user_signed_in?


  private

  def user_verified?
    redirect_to sms_verification_path if !current_user.sms_verified?
  end


end
