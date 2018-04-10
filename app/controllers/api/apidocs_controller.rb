class Api::ApidocsController < Api::BaseController
  include Swagger::Blocks
  skip_before_action :authenticate_request

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '2.0.0'
      key :title, 'Swagger Userstore'
      key :description, 'A sample API that uses a userstore as an example to ' \
                        'demonstrate features in the swagger-2.0 specification'
      key :termsOfService, 'http://helloreverb.com/terms/'
      contact do
        key :name, 'Wordnik API Team'
      end
      license do
        key :name, 'MIT'
      end
    end
    tag do
      key :name, 'Equipment'
      key :description, 'Equipment operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    tag do
      key :name, 'Service Item'
      key :description, 'Service Item operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    tag do
      key :name, 'Service'
      key :description, 'Service operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    tag do
      key :name, 'Photo'
      key :description, 'Photo operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    tag do
      key :name, 'Post'
      key :description, 'Posts operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    tag do
      key :name, 'Tag'
      key :description, 'Tag operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    tag do
      key :name, 'Auth'
      key :description, 'Login and Logout'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    tag do
      key :name, 'User'
      key :description, 'Users operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    tag do
      key :name, 'Comment'
      key :description, 'Comment operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    key :consumes, ['application/json']
    key :produces, ['application/json']
    security_definition 'Authorization' do
      key :type, :apiKey
      key :name, 'Authorization'
      key :in, :header
    end

  end


  SWAGGERED_CLASSES = [
      Api::EquipmentController,
      Equipment,
      Api::ServiceItemsController,
      ServiceItem,
      Api::ServicesController,
      Service,
      Api::PhotosController,
      Photo,
      Api::TagsController,
      Tag,
      Api::PostsController,
      Post,
      Api::UsersController,
      User,
      Api::CommentsController,
      Comment,
      Api::AuthenticationController,
      self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end


end