module Swaggers
  module PostSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do
      swagger_path 'api/posts' do
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
            key :description, 'Academic level created successfully'
            schema do
              key :'$ref', :AcademicLevelInput
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
      end

      swagger_path '/academic_levels/{id}' do
        operation :get do
          key :description, 'Returns a single Academic Level'
          key :operationId, 'find Academic level By Id'
          key :tags, [
              'Academic level'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Academic Level to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'access-token', []
            key :client, []
            key :uid, []
          end
          response 200 do
            key :description, 'Academic Level fetched successfully'
            schema do
              key :'$ref', :AcademicLevelInput
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
          key :description, 'Update a Academic Level'
          key :operationId, 'Update Academic Level'
          key :tags, [
              'Academic level'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Academic level to Update'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          parameter do
            key :name, 'academic_level[school_information_id]'
            key :in, :query
            key :description, 'School Information id'
            key :required, false
            key :type, :string
            key :'$ref', :AcademicLevelInput
          end
          parameter do
            key :name, 'academic_level[name]'
            key :in, :query
            key :description, 'Academic level Name'
            key :required, false
            key :type, :string
            key :'$ref', :AcademicLevelInput
          end
          parameter do
            key :name, 'academic_level[incorporation_number]'
            key :in, :query
            key :description, 'Academic level Incorporation_number'
            key :required, false
            key :type, :string
            key :'$ref', :AcademicLevelInput
          end
          parameter do
            key :name, 'academic_level[Key]'
            key :in, :query
            key :description, 'Academic level Key'
            key :required, false
            key :type, :string
            key :'$ref', :AcademicLevelInput
          end
          security do
            key 'access-token', []
            key :client, []
            key :uid, []
          end
          response 200 do
            key :description, 'Academic level updated successfully'
            schema do
              key :'$ref', :AcademicLevelInput
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
          key :description, 'Delete Academic Level'
          key :operationId, 'delete Academic Level'
          key :tags, [
              'Academic level'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Academic level to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'access-token', []
            key :client, []
            key :uid, []
          end
          response 200 do
            key :description, 'Academic level Deleted Successfully'
            schema do
              key :'$ref', :AcademicLevel
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
