class Api::SessionsController < Api::BaseController

  def create
    @session = Session.auth params[:email], params[:password]
    render_response @session
  end

  def destroy
    authenticate_or_request_with_http_token do |token, options|
      @session = Session.find_by_token token
    end
    @session.destroy!
    render_response nil, 204
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
