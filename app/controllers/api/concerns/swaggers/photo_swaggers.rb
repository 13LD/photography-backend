module Api::Concerns::Swaggers
  module PhotoSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do

      swagger_path '/api/photos' do
        operation :get do
          key :description, 'List of photos'
          key :operationId, 'Photos'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Photo'
          ]

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Photos fetched successfully'
            schema do
              key :'$ref', :PhotoInput
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
          key :description, 'Creates a new Photo'
          key :operationId, 'Add Photo'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Photo'
          ]

          parameter do
            key :name, 'photo[file]'
            key :in, :formData
            key :description, 'Photo File'
            key :required, false
            key :type, :file
            key :'$ref', :PhotoInput
          end

          parameter do
            key :name, 'photo[tag_id]'
            key :in, :formData
            key :description, 'Photo Tag ID'
            key :required, true
            key :type, :integer
            key :format, :int64
            key :'$ref', :PhotoInput
          end

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Post created successfully'
            schema do
              key :'$ref', :PhotoInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :PhotoInput
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

      swagger_path '/api/photos/{id}' do
        operation :get do
          key :description, 'Returns a single Photo'
          key :operationId, 'find Photo By Id'
          key :tags, [
              'Photo'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Photo to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Photo fetched successfully'
            schema do
              key :'$ref', :PhotoInput
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
          key :description, 'Update a Photo'
          key :operationId, 'Update Photo'
          key :tags, [
              'Photo'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Photo to Update'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          parameter do
            key :name, 'photo[file]'
            key :in, :formData
            key :description, 'Photo File'
            key :required, false
            key :type, :file
            key :'$ref', :PhotoInput
          end

          parameter do
            key :name, 'photo[tag_id]'
            key :in, :formData
            key :description, 'Photo Tag ID'
            key :required, true
            key :type, :integer
            key :format, :int64
            key :'$ref', :PhotoInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Photo updated successfully'
            schema do
              key :'$ref', :PhotoInput
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
          key :description, 'Delete Photo'
          key :operationId, 'delete Photo'
          key :tags, [
              'Photo'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Photo to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Photo Deleted Successfully'
            schema do
              key :'$ref', :Photo
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
