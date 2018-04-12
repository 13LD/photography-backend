module Api::Concerns::Swaggers
  module TagSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do

      swagger_path '/api/tags' do
        operation :get do
          key :description, 'List of tags'
          key :operationId, 'Tags'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Tag'
          ]

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Tags fetched successfully'
            schema do
              key :'$ref', :TagInput
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
          key :description, 'Creates a new Tag'
          key :operationId, 'Add Tag'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Tag'
          ]
          parameter do
            key :name, 'tag[tag_name]'
            key :in, :formData
            key :description, 'Tag Name'
            key :required, true
            key :type, :string
            key :'$ref', :TagInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Tag created successfully'
            schema do
              key :'$ref', :TagInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :TagInput
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

      swagger_path '/api/tags/{id}' do
        operation :get do
          key :description, 'Returns a single Tag'
          key :operationId, 'find Tag By Id'
          key :tags, [
              'Tag'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Tag to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Tag fetched successfully'
            schema do
              key :'$ref', :TagInput
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
          key :description, 'Update a Tag'
          key :operationId, 'Update Tag'
          key :tags, [
              'Tag'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Tag to Update'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          parameter do
            key :name, 'tag[tag_name]'
            key :in, :formData
            key :description, 'Tag Name'
            key :required, true
            key :type, :string
            key :'$ref', :TagInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Tag updated successfully'
            schema do
              key :'$ref', :TagInput
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
          key :description, 'Delete Tag'
          key :operationId, 'delete Tag'
          key :tags, [
              'Tag'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Tag to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Tag Deleted Successfully'
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
