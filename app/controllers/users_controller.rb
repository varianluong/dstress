class UsersController < ApplicationController
  # index page. if logged in, redirec to main
  def index
    if current_user
      redirect_to "/main"
    else
      redirect_to "/sessions/new"
    end
  end

  # create the user and set the session 
  # if errors, redirect back to the form
  def create
    flash[:messages] =[]
    user = User.new(user_params)

    if user.save
      flash[:messages].push({ 'status' => 'success', 'text' => "Successfully added"  })
      session[:user_id] = user.id
      redirect_to "/main"
    else
      errors = user.errors.full_messages
      errors.each do |error|
        flash[:messages].push({ 'status' => 'error', 'text' => error })
      end
      redirect_to "/sessions/new"
    end
  end

  private

  # sanitize user params
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :handle, :location, :password, :password_confirmation)
  end
end
