module Api::Concerns::Swaggers
  module ContactSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do

      swagger_path '/api/contacts' do
        operation :get do
          key :description, 'List of Contacts'
          key :operationId, 'Contacts'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Contact'
          ]

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Contact fetched successfully'
            schema do
              key :'$ref', :ContactInput
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
          key :description, 'Creates a new Contact'
          key :operationId, 'Add Contact'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Contact'
          ]
          parameter do
            key :name, 'contact[email]'
            key :in, :formData
            key :description, 'Contact email'
            key :required, true
            key :type, :string
            key :'$ref', :ContactInput
          end
          parameter do
            key :name, 'contact[phone1]'
            key :in, :formData
            key :description, 'Contact phone'
            key :required, true
            key :type, :string
            key :'$ref', :ContactInput
          end
          parameter do
            key :name, 'contact[phone1]'
            key :in, :formData
            key :description, 'Contact phone'
            key :required, false
            key :type, :string
            key :'$ref', :ContactInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Contact created successfully'
            schema do
              key :'$ref', :ContactInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :ContactInput
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

      swagger_path '/api/contacts/{id}' do
        operation :get do
          key :description, 'Returns a single Contact'
          key :operationId, 'find Contact By Id'
          key :tags, [
              'Contact'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Contact to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Contact fetched successfully'
            schema do
              key :'$ref', :ContactInput
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
          key :description, 'Update a Contact'
          key :operationId, 'Update Contact'
          key :tags, [
              'Contact'
          ]
          parameter do
            key :name, 'contact[email]'
            key :in, :formData
            key :description, 'Contact email'
            key :required, false
            key :type, :string
            key :'$ref', :ContactInput
          end
          parameter do
            key :name, 'contact[phone1]'
            key :in, :formData
            key :description, 'Contact phone'
            key :required, false
            key :type, :string
            key :'$ref', :ContactInput
          end
          parameter do
            key :name, 'contact[phone1]'
            key :in, :formData
            key :description, 'Contact phone'
            key :required, false
            key :type, :string
            key :'$ref', :ContactInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Contact updated successfully'
            schema do
              key :'$ref', :ContactInput
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
          key :description, 'Delete Contact'
          key :operationId, 'delete Contact'
          key :tags, [
              'Contact'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Contact to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Contact Deleted Successfully'
            schema do
              key :'$ref', :Contact
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
