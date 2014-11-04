class UsersController < ApplicationController
before_action :check_auth

  def show
    @user = current_user
    @todos = @user.todos  
    @new_todo = @user.todos.build
    authorize @user
  end

  private

  def check_auth
    @user = User.find(params[:id])
    if @user != current_user
      flash[:error] = "Sorry, you can’t can't access this"
      redirect_to root_path
    end
  end

end
