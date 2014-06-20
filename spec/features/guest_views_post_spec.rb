require 'capybara/rspec'

feature 'guest views blog post' do
  scenario 'via the home page' do
    post = Post.new(name: 'post', body: 'the body')
    PostRepository.create(post)

    visit '/'

    click_on post.name

    expect(page).to have_content(post.body)
  end
end
