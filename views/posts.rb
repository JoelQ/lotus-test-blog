require 'lotus/view'
require 'views/application_layout'

module Posts
  class Index
    include Lotus::View
    layout :application
  end

  class Show
    include Lotus::View
  end
end

Lotus::View.root = 'templates'

Lotus::View.load!
