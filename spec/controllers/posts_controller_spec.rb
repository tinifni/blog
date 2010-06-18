require 'spec_helper'

describe PostsController, 'routes' do
  it { should route(:get, '/posts/new').to(:action => 'new') }
  it { should route(:post, '/posts').to(:action => 'create') }
  it { should route(:get, '/posts').to(:action => 'index') }
end

describe PostsController, 'GET to index' do
  before { get :index }
  it { should render_template(:index) }
  it { should respond_with(:success) }
  it { should assign_to(:posts) }
end

describe PostsController, 'POST to create with valid parameters' do
  before do
    post :create, :post => {
      :title => 'Hey!',
      :body => 'The body',
    }
  end
  it { should set_the_flash.to(/created/i) }
  it { should redirect_to(posts_path) }
  it { should assign_to(:post) }
end

describe PostsController, 'POST to create with invalid parameters' do
  before do
    post :create, :post => { 
        :title => '', :body => ''
      }
  end
  it { should render_template(:new) }
end
