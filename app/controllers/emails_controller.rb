require 'openssl'
class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!



  # GET /emails
  # GET /emails.json
  def index
    @received_emails = current_user.received_emails.all
    @sent_emails = current_user.sent_emails.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
    decrypt_process
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = current_user.sent_emails.new(email_params)

    respond_to do |format|
      if @email.save
        format.html { redirect_to @email, notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def decrypt
    decrypt_process
    @check_sum = Digest::SHA256.hexdigest(@email.content)
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def decrypt_process
    @email = Email.find(params[:email_id]) unless @email.present?
    cipher = OpenSSL::Cipher::AES.new(256, :CBC)
    cipher.decrypt
    cipher.iv = @email.iv
    cipher.key = Digest::SHA256.hexdigest(decrypt_params[:aes_key]).first(32)
    text = cipher.update(@email.content.gsub("null","\u0000").encode('ISO-8859-1').force_encoding('ASCII-8BIT'))
    @email.content = text.split('-divider-')[0]
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = current_user.received_emails.find(params[:id])
      @email ||= current_user.sent_emails.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:title, :receiver_email, :content, :user, :aes_key, :check)
    end

    def decrypt_params
      params.require(:decrypt).permit(:aes_key)
    end
end
