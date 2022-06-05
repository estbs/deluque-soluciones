class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user)
          .permit(
            :name,
            :lastname,
            :phone_number,
            :identification_type,
            :identification_number,
            :email,
            address_attributes: %i[id street city state country]
          )
  end

  def assign_user
    @user = User.find(params[:id])
  end
end
