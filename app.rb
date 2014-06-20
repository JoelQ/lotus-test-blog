require 'lotus-controller'


require 'lotus/model/adapters/sql_adapter'
require 'lotus/router'
require 'views/posts'
require 'controllers/posts_controller'
require 'repositories/post_repository'
require 'models/post'

class App
  CONNECTION_URL = 'postgres://localhost:5432/blog'

  attr_reader :router

  def initialize
    @mapper = Lotus::Model::Mapper.new do
      collection :posts do
        entity Post

        attribute :id, Integer
        attribute :name, String
        attribute :body, String
      end
    end

    @adapter = Lotus::Model::Adapters::SqlAdapter.new(@mapper, CONNECTION_URL)

    PostRepository.adapter = @adapter
    @mapper.load!

    @router = Lotus::Router.new do
      resources 'posts'
      get '/', to: 'posts#index'
    end
  end
end


