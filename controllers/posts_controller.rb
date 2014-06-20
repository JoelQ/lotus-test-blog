module PostsController
  class Index
    include Lotus::Action

    def call(params)
      posts = PostRepository.all
      self.body = Posts::Index.render(format: :html, posts: posts)
    end
  end

  class Show
    include Lotus::Action

    def call(params)
      post = PostRepository.find(params[:id])
      self.body = Posts::Show.render(format: :html, post: post)
    end
  end
end
