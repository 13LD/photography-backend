module Api::Concerns::Swaggers
  module UserSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do
      swagger_path '/api/users' do
        operation :get do
          key :description, 'List of users'
          key :operationId, 'Users'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'User'
          ]

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'User fetched successfully'
            schema do
              key :'$ref', :UserInput
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
          key :description, 'Creates a new User'
          key :operationId, 'Add User'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'User'
          ]
          parameter do
            key :name, 'user[email]'
            key :in, :query
            key :description, 'User Email'
            key :required, true
            key :type, :string
            key :'$ref', :UserInput
          end
          parameter do
            key :name, 'user[password]'
            key :in, :query
            key :description, 'User Email'
            key :required, true
            key :type, :string
            key :'$ref', :UserInput
          end
          parameter do
            key :name, 'user[password_confirmation]'
            key :in, :query
            key :description, 'User Email'
            key :required, true
            key :type, :string
            key :'$ref', :UserInput
          end
          parameter do
            key :name, 'user[name]'
            key :in, :query
            key :description, 'User Email'
            key :required, true
            key :type, :string
            key :'$ref', :UserInput
          end

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'User created successfully'
            schema do
              key :'$ref', :UserInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :UserInput
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

      swagger_path '/api/users/{id}' do
        operation :get do
          key :description, 'Returns a single User'
          key :operationId, 'find User By Id'
          key :tags, [
              'User'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of User to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'User fetched successfully'
            schema do
              key :'$ref', :UserInput
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
          key :description, 'Update a User'
          key :operationId, 'Update User'
          key :tags, [
              'User'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of User to Update'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          parameter do
            key :name, 'user[email]'
            key :in, :query
            key :description, 'User Email'
            key :required, true
            key :type, :string
            key :'$ref', :UserInput
          end
          parameter do
            key :name, 'user[password]'
            key :in, :query
            key :description, 'User Email'
            key :required, true
            key :type, :string
            key :'$ref', :UserInput
          end
          parameter do
            key :name, 'user[password_confirmation]'
            key :in, :query
            key :description, 'User Email'
            key :required, true
            key :type, :string
            key :'$ref', :UserInput
          end
          parameter do
            key :name, 'user[name]'
            key :in, :query
            key :description, 'User Email'
            key :required, true
            key :type, :string
            key :'$ref', :UserInput
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'User updated successfully'
            schema do
              key :'$ref', :UserInput
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
          key :description, 'Delete User'
          key :operationId, 'delete User'
          key :tags, [
              'User'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of User to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'User Deleted Successfully'
            schema do
              key :'$ref', :User
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
