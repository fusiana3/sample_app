class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    # => GET app/views/users/show.html.erb
  end

  # GET /users/new or /signup
  def new
    @user = User.new
    # => GET app/views/users/new.html.erb
  end

  def create
    @user = User.new(user_params)    # 実装は終わっていないことに注意!
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
    #Strong Parameters
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
