class Api::UsersController < Api::BaseController
  before_action :user_verify, only: [:update, :destroy, :show, :index]

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

  def user_verify
      raise UnauthorizedError if @session.user_id != params[:id].to_i
  end
end
