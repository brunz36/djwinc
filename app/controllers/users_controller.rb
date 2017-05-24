class UsersController < ApplicationController
  # before_action :authorize

  # GET /users
  def index
    @users = User.order(:name)
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, notice: "User #{@user.name} was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_url, notice: "User #{@user.name} was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
