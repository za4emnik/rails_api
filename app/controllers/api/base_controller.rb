class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_access_token
  before_action :find_user, only: [:update, :destroy, :show, :index, :create]

  rescue_from UnauthorizedError do |e|
    render_error({ 'message'=>'Not Authorized' }.to_json, 401)
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error({ 'message'=>'Not found' }.to_json, 404)
  end

  def render_response(data, status=200)
    render_json data, status
  end

  def render_error(data, status=400)
    render_json data, status
  end

  private

  def render_json(data, status)
      render json: data, status: status
  end

  def verify_access_token
    authenticate_or_request_with_http_token do |token, options|
      @session = Session.find_by_token token
    end
  end

  def find_user
    @user = User.find(@session.user_id)
  end
end
