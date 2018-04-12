module Api::Concerns::Swaggers
  module EquipmentSwaggers
    extend ActiveSupport::Concern
    include Swagger::Blocks
    included do

      swagger_path '/api/equipment' do
        operation :get do
          key :description, 'List of Equipments'
          key :operationId, 'Equipments'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Equipment'
          ]

          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Equipments fetched successfully'
            schema do
              key :'$ref', :EquipmentInput
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
          key :description, 'Creates a new Equipment'
          key :operationId, 'Add Equipment'
          key :produces, [
              'application/json'
          ]
          key :tags, [
              'Equipment'
          ]
          parameter do
            key :name, 'equipment[name]'
            key :in, :formData
            key :description, 'Equipment Name'
            key :required, true
            key :type, :string
            key :'$ref', :EquipmentInput
          end
          parameter do
            key :name, 'equipment[description]'
            key :in, :formData
            key :description, 'Equipment description'
            key :required, true
            key :type, :string
            key :'$ref', :EquipmentInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Equipment created successfully'
            schema do
              key :'$ref', :EquipmentInput
            end
          end
          response 403 do
            key :description, 'Permission denied'
            schema do
              key :'$ref', :EquipmentInput
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

      swagger_path '/api/equipment/{id}' do
        operation :get do
          key :description, 'Returns a single Equipment'
          key :operationId, 'find Equipment By Id'
          key :tags, [
              'Equipment'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Equipment to fetch'
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
              key :'$ref', :EquipmentInput
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
          key :description, 'Update a Equipment'
          key :operationId, 'Update Equipment'
          key :tags, [
              'Equipment'
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
            key :name, 'equipment[name]'
            key :in, :formData
            key :description, 'Equipment Name'
            key :required, false
            key :type, :string
            key :'$ref', :EquipmentInput
          end
          parameter do
            key :name, 'equipment[description]'
            key :in, :formData
            key :description, 'Equipment description'
            key :required, false
            key :type, :string
            key :'$ref', :EquipmentInput
          end


          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Equipment updated successfully'
            schema do
              key :'$ref', :EquipmentInput
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
          key :description, 'Delete Equipment'
          key :operationId, 'delete Equipment'
          key :tags, [
              'Equipment'
          ]
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of Equipment to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          security do
            key 'Authorization', []
          end
          response 200 do
            key :description, 'Equipment Deleted Successfully'
            schema do
              key :'$ref', :Equipment
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
