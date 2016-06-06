class Api::ImagesController < Api::BaseController
  before_action :set_image, only: [:show, :update, :destroy]

  def index
    render_response @user.images.page params[:page]
  end

  def show
    render_response @image
  end

  def create
    image = @user.images.build
    image.remote_image_url = params[:image]
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

  def set_image
     @image = Image.find(params[:id])
   end
end
