module Api::Concerns::Swaggers
  module ServiceSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do

      swagger_path '/api/services' do
        operation :get do
          key :description, 'List of services'
          key :operationId, 'Services'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Service'
          ]

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Services fetched successfully'
            schema do
              key :'$ref', :ServiceInput
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
          key :description, 'Creates a new Service'
          key :operationId, 'Add Service'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Service'
          ]
          parameter do
            key :name, 'service[package_name]'
            key :in, :formData
            key :description, 'Package Name'
            key :required, false
            key :type, :string
            key :'$ref', :ServiceInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Service created successfully'
            schema do
              key :'$ref', :ServiceInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :ServiceInput
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

      swagger_path '/api/services/{id}' do
        operation :get do
          key :description, 'Returns a single Service'
          key :operationId, 'find Service By Id'
          key :tags, [
              'Service'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Service to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Service fetched successfully'
            schema do
              key :'$ref', :ServiceInput
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
          key :description, 'Update a Service'
          key :operationId, 'Update Service'
          key :tags, [
              'Service'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Service to Update'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          parameter do
            key :name, 'service[package_name]'
            key :in, :formData
            key :description, 'Package Name'
            key :required, false
            key :type, :string
            key :'$ref', :ServiceInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Service updated successfully'
            schema do
              key :'$ref', :ServiceInput
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
          key :description, 'Delete Service'
          key :operationId, 'delete Service'
          key :tags, [
              'Service'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Service to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Service Deleted Successfully'
            schema do
              key :'$ref', :Tag
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
