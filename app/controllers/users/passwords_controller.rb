class Users::PasswordsController < Devise::PasswordsController
  before_action :check_guest, only: :create
  def check_guest
    if params[:user][:email].downcase == 'guest@example.com'
      redirect_to new_user_session_path, alert: 'ゲストユーザーのパスワード再設定はできません。'
    end
  end
  
end