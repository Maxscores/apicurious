class SessionsController < ApplicationController
  def create
    user = User.from_github(auth_hash)

    session["user_id"] = user.id

    redirect_to dashboard_index_path
  end

  def destroy
    session["user_id"] = nil
    redirect_to root_path
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
