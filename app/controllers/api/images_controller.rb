class Api::ImagesController < Api::BaseController
  before_action :verify_access_token
  before_action :find_user
  before_action :set_image, only: [:show, :update, :destroy]

  def index
    render_response @user.images.page params[:page]
  end

  def show
    render_response @image
  end

  def create
    #@image = @user.images.create! user_id: @user.id, image: params[:image]
    #@image = User.image.create! user: @user, image: params[:image]
    image = @user.images.create
    image.remote_image_url = "http://www.fullhdoboi.com/wallpapers/thumbs/6/kartinka-apelsiny-1885.jpg"
    image.save!
    render_response image
  end

  def update
    @image.update! image_params
    render_response @image
  end

  def destroy
    @image.destroy!
    render_response nil, 204
  end

  private

  def image_params
    params.permit(:image)
  end

  def find_user
    @user = User.find(@session.user_id)
  end

  def verify_access_token
    authenticate_or_request_with_http_token do |token, options|
      @session = Session.find_by_token token
    end
  end

  def set_image
     @image = Image.find(params[:id])
   end
end
