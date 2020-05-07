class SmsVerificationController < ApplicationController
  skip_before_action :user_verified?
  def index; end

  def submit
    unless current_user.sms_code == sms_params[:code]
      sign_out current_user
    else
      current_user.update(sms_verified?: true)
    end
    redirect_to root_path
  end

  private
  def sms_params
    params.require(:sms).permit(:code)
  end

  def send_sms

  end
end
