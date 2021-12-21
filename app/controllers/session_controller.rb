# frozen_string_literal: true

class SessionController < ApplicationController
  skip_before_action :require_login, only: %i[login create]
  def login; end

  def create
    # p params[:username]
    # user2= User.find_by(username: params[:username] )
    # p "-----------------------------------"
    user1 = User.find_by(username: params[:username])
    # p user1
    # p user1.password_digest
    # p "FFFF____"
    # p user1&.authenticate(params[:password])
    # p "-----------------------------------"
    # user 2 don't work why??????

    # if !user2.password_digest.present? || user2.password_digest=0 then
    #   p "CHANGE PASS"
    #   p user2.password

    #   p user2.password_digest

    #   # p user2.authenticate(555)
    # end
    if user1&.authenticate(params[:password])
      # if user.present? && user.authenticate(params[:password])
      p 'Login'
      sign_in user1
      redirect_to root_url
    else
      p 'Redirect'
      redirect_to session_login_url
    end
  end

  def logout
    sign_out
    redirect_to session_login_url
  end
end
