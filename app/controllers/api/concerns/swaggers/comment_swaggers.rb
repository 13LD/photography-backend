module Api::Concerns::Swaggers
  module CommentSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do
      swagger_path '/api/comments' do
        operation :get do
          key :description, 'List of comments'
          key :operationId, 'Comments'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Comment'
          ]

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Comment fetched successfully'
            schema do
              key :'$ref', :CommentInput
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
          key :description, 'Creates a new Comment'
          key :operationId, 'Add Comment'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Comment'
          ]
          parameter do
            key :name, 'comment[title]'
            key :in, :query
            key :description, 'Comment title'
            key :required, false
            key :type, :string
            key :'$ref', :CommentInput
          end
          parameter do
            key :name, 'comment[content]'
            key :in, :query
            key :description, 'Comment title'
            key :required, true
            key :type, :string
            key :'$ref', :CommentInput
          end
          parameter do
            key :name, 'comment[user_id]'
            key :in, :query
            key :description, 'Comment User ID'
            key :required, true
            key :type, :integer
            key :format, :int64
            key :'$ref', :CommentInput
          end
          parameter do
            key :name, 'comment[post_id]'
            key :in, :query
            key :description, 'Comment Post ID'
            key :required, true
            key :type, :integer
            key :format, :int64
            key :'$ref', :CommentInput
          end

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'User created successfully'
            schema do
              key :'$ref', :CommentInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :CommentInput
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

      swagger_path '/api/comments/{id}' do
        operation :get do
          key :description, 'Returns a single Comment'
          key :operationId, 'find Comment By Id'
          key :tags, [
              'Comment'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Comment to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Comment fetched successfully'
            schema do
              key :'$ref', :CommentInput
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
          key :description, 'Update a Comment'
          key :operationId, 'Update Comment'
          key :tags, [
              'Comment'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Comment to Update'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          parameter do
            key :name, 'comment[title]'
            key :in, :query
            key :description, 'Comment title'
            key :required, false
            key :type, :string
            key :'$ref', :CommentInput
          end
          parameter do
            key :name, 'comment[content]'
            key :in, :query
            key :description, 'Comment title'
            key :required, true
            key :type, :string
            key :'$ref', :CommentInput
          end
          parameter do
            key :name, 'comment[user_id]'
            key :in, :query
            key :description, 'Comment User ID'
            key :required, true
            key :type, :integer
            key :format, :int64
            key :'$ref', :CommentInput
          end
          parameter do
            key :name, 'comment[post_id]'
            key :in, :query
            key :description, 'Comment Post ID'
            key :required, true
            key :type, :integer
            key :format, :int64
            key :'$ref', :CommentInput
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Comment updated successfully'
            schema do
              key :'$ref', :CommentInput
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
          key :description, 'Delete Comment'
          key :operationId, 'delete Comment'
          key :tags, [
              'Comment'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Comment to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Comment Deleted Successfully'
            schema do
              key :'$ref', :Comment
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
    end
  end
end
