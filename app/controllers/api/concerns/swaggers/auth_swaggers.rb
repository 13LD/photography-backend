module Api::Concerns::Swaggers
  module AuthSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do
      swagger_path '/api/authenticate' do

        operation :post do
          key :description, 'Creates a new Token'
          key :operationId, 'Create new Token'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Auth'
          ]
          parameter do
            key :name, 'email'
            key :in, :query
            key :description, 'Auth email'
            key :required, false
            key :type, :string
            key :'$ref', :AuthInput
          end
          parameter do
            key :name, 'password'
            key :in, :query
            key :description, 'Auth password'
            key :required, true
            key :type, :string
            key :'$ref', :AuthInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Auth Token created successfully'
            schema do
              key :'$ref', :AuthInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :AuthInput
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
      swagger_path '/api/logout' do

        operation :post do
          key :description, 'Destroy Token'
          key :operationId, 'Destroy Token'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Auth'
          ]
          parameter do
            key :name, 'email'
            key :in, :query
            key :description, 'Auth email'
            key :required, false
            key :type, :string
            key :'$ref', :AuthInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Token destroyed successfully'
            schema do
              key :'$ref', :AuthInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :AuthInput
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
    end
  end
end
