class Api::PostsController < Api::BaseController
  before_action :set_post, only: [:show, :update, :destroy]
  include Api::Concerns::Swaggers::PostSwaggers

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  def download_image
    if params[:image] == 'image'
      @post = Post.find(params[:id])
      response.headers['Content-Length'] = @post.send(params[:image].to_sym).size.to_s
      send_file("#{@post.send(params[:image].to_sym).path}")
    else
      render :json => { :errors => "Image not found" }
    end
  end


  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      @post.reload
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
end
