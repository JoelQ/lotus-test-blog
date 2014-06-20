module PostsController
  class Index
    include Lotus::Action

    def call(params)
      posts = PostRepository.all
      self.body = Posts::Index.render(format: :html, posts: posts)

    rescue => ex
      puts ex
    end
  end

  class Show
    include Lotus::Action

    def call(params)
      post = PostRepository.find(params[:id])
      self.body = Posts::Show.render(format: :html, post: post)

    rescue => ex
      puts ex
    end
  end
end
