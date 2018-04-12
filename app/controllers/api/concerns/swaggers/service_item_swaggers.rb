module Api::Concerns::Swaggers
  module ServiceItemSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do
      swagger_path '/api/service_items' do
        operation :get do
          key :description, 'List of Service Items'
          key :operationId, 'Service Items'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Service Item'
          ]

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Comment fetched successfully'
            schema do
              key :'$ref', :ServiceItemInput
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
          key :description, 'Creates a new Service Item'
          key :operationId, 'Add Service Item'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Service Item'
          ]
          parameter do
            key :name, 'service_item[description]'
            key :in, :query
            key :description, 'Comment title'
            key :required, true
            key :type, :string
            key :'$ref', :ServiceItemInput
          end

          parameter do
            key :name, 'service_item[service_id]'
            key :in, :query
            key :description, 'Service Item Service ID'
            key :required, true
            key :type, :integer
            key :format, :int64
            key :'$ref', :ServiceItemInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Service Item created successfully'
            schema do
              key :'$ref', :ServiceItemInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :ServiceItemInput
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

      swagger_path '/api/service_items/{id}' do
        operation :get do
          key :description, 'Returns a single Service Item'
          key :operationId, 'find Service Item By Id'
          key :tags, [
              'Service Item'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Service Item to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Service Item fetched successfully'
            schema do
              key :'$ref', :ServiceItemInput
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
          key :description, 'Update a Service Item'
          key :operationId, 'Update Service Item'
          key :tags, [
              'Service Item'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Service Item to Update'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          parameter do
            key :name, 'service_item[description]'
            key :in, :query
            key :description, 'Comment title'
            key :required, false
            key :type, :string
            key :'$ref', :ServiceItemInput
          end

          parameter do
            key :name, 'Service_item[service_id]'
            key :in, :query
            key :description, 'Service Item Service ID'
            key :required, true
            key :type, :integer
            key :format, :int64
            key :'$ref', :ServiceItemInput
          end

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Service Item updated successfully'
            schema do
              key :'$ref', :ServiceItemInput
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
          key :description, 'Delete Service Item'
          key :operationId, 'delete Service Item'
          key :tags, [
              'Service Item'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Service Item to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'User Service Item Successfully'
            schema do
              key :'$ref', :ServiceItem
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
