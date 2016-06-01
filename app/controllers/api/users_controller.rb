class Api::UsersController < Api::BaseController
  before_action :find_user, only: [:update, :destroy, :show]

  def show
    render_response @user
  end

  def create
    @user = User.create! user_params
    render_response @user
  end

  def update
    @user.update! user_params
    render_response @user
  end

  def destroy
    @user.destroy!
    render_response nil, 204
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
