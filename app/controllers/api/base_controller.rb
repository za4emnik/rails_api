class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token

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
end
