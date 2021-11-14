class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  # def index
  #   render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  # end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
    )
    # session[:current_user_id] = new_user.id
    redirect_to "/"
    # render plain: "New user has been created with name #{new_user.first_name} and email #{new_user.email}"
  end

  # def login
  #   email = params[:email]
  #   password = params[:password]
  #   user = User.find_by(email: email, password: password)
  #   render plain: user.present?
  # end
end
