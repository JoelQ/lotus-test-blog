class Post
  attr_accessor :id, :name, :body

  def initialize(attributes = {})
    @id, @name, @body = attributes.values_at(:id, :name, :body)
  end
end

