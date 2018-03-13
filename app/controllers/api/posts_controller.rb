class Api::PostsController < Api::BaseController
  before_action :set_post, only: [:show, :update, :destroy]
  include Swagger::Blocks
  swagger_path '/api/posts' do
    operation :get do
      key :description, 'List of posts'
      key :operationId, 'Posts'
      key :produces, [
          'application/json'
      ]
      key :tags, [
          'Post'
      ]

      security do
        key 'Authorization', []
      end
      response 200 do
        key :description, 'Posts fetched successfully'
        schema do
          key :'$ref', :PostInput
        end
      end
      response 403 do
        key :description, 'Permission denied'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
    operation :post do
      key :description, 'Creates a new Post'
      key :operationId, 'Add Post'
      key :produces, [
          'application/json'
      ]
      key :tags, [
          'Post'
      ]
      parameter do
        key :name, 'post[title]'
        key :in, :query
        key :description, 'Title'
        key :required, true
        key :type, :string
        key :'$ref', :PostInput
      end
      parameter do
        key :name, 'post[description]'
        key :in, :query
        key :description, 'Academic level Name'
        key :required, false
        key :type, :string
        key :'$ref', :PostInput
      end

      security do
        key 'Authorization', []
      end
      response 200 do
        key :description, 'Post created successfully'
        schema do
          key :'$ref', :PostInput
        end
      end
      response 403 do
        key :description, 'Permission denied'
        schema do
          key :'$ref', :PostInput
        end
      end
      response 422 do
        key :description, 'Missing Parameters or Request rejected'
        schema do
          key :'$ref', :RejectRequest
        end
      end
    end
  end

  swagger_path '/api/posts/{id}' do
    operation :get do
      key :description, 'Returns a single Post'
      key :operationId, 'find Post By Id'
      key :tags, [
          'Post'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of Post to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      security do
        key 'Authorization', []
      end
      response 200 do
        key :description, 'Post fetched successfully'
        schema do
          key :'$ref', :PostInput
        end
      end
      response 403 do
        key :description, 'Permission denied'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
    operation :put do
      key :description, 'Update a Post'
      key :operationId, 'Update Post'
      key :tags, [
          'Post'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of Post to Update'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      parameter do
        key :name, 'post[title]'
        key :in, :query
        key :description, 'Title'
        key :required, true
        key :type, :string
        key :'$ref', :PostInput
      end
      parameter do
        key :name, 'post[description]'
        key :in, :query
        key :description, 'Academic level Name'
        key :required, false
        key :type, :string
        key :'$ref', :PostInput
      end
      security do
        key 'Authorization', []
      end
      response 200 do
        key :description, 'Academic level updated successfully'
        schema do
          key :'$ref', :PostInput
        end
      end
      response 403 do
        key :description, 'Permission denied'
        schema do
          key :'$ref', :ErrorModel
        end
      end
      response 422 do
        key :description, 'Missing Parameters or Request rejected'
        schema do
          key :'$ref', :RejectRequest
        end
      end
    end
    operation :delete do
      key :description, 'Delete Post'
      key :operationId, 'delete Post'
      key :tags, [
          'Post'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of Post to delete'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      security do
        key 'Authorization', []
      end
      response 200 do
        key :description, 'Post Deleted Successfully'
        schema do
          key :'$ref', :Post
        end
      end
      response 403 do
        key :description, 'Permission denied'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end
  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
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
      params.require(:post).permit(:title, :description)
    end
end
