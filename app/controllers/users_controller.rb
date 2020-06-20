class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "/users/new"
  end

  def create
    new_user = User.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone],
      address: params[:address],
      password: params[:password],
      role: params[:role],
    )
    if new_user.save
      if new_user.role == "clerk"
        redirect_to new_clerks_path
        flash[:notice] = "Created Billing-Clerk successfully."
      else
        redirect_to new_sessions_path
        flash[:notice] = "Please Sign-in to continue."
      end
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

  def edit
    id = params[:id]
    user = User.find(id)
    render "clerk_edit", locals: { user: user }
  end

  def updateclerk
    id = params[:id]
    user = User.find(id)
    user.name = params[:name]
    user.email = params[:email]
    user.phone = params[:phone]
    user.address = params[:address]
    user.password = params[:password]
    user.save
    flash[:notice] = "updated successfully"
    redirect_to users_list_path
  end

  def view
    id = params[:id]
    user = User.find(id)
    render "user_view", locals: { user: user }
  end

  def destroy
    id = params[:id]
    user = User.all.find(id)
    user.destroy
    redirect_to users_path
  end
end
