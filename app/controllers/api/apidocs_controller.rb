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
      key :name, 'Post'
      key :description, 'Posts operations'
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
      Api::PostsController,
      Post,
      self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end


end