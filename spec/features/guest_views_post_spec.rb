$LOAD_PATH << File.expand_path('../../..', __FILE__)

require 'capybara/rspec'
require 'repositories/post_repository'
require 'models/post'
require 'app'

app = App.new
Capybara.app = app.router

feature 'guest views blog post' do
  before(:each) do
    conn = PG::Connection.open(dbname: 'blog')
    conn.exec('TRUNCATE TABLE posts')
  end

  scenario 'via the home page' do
    post = Post.new(name: 'post', body: 'the body')
    PostRepository.create(post)

    visit '/'
    save_and_open_page
    click_on post.name

    expect(page).to have_content(post.body)
  end
end
