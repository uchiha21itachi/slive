class UsersController < ApplicationController

 def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
  @user = current_user
  end

  def update
    @user =  current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
     redirect_to edit_user_path(@user)
  end
end

  def destroy
  end

private

  def user_params
    params.require(:user).permit(:full_name, :birth_date, :occupation, :phone_number)
  end
end
