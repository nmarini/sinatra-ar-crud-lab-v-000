
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts' do

    @posts = Post.all

    erb :index
  end

  post '/posts' do
    @post = Post.create(params)
    erb :show
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])

    erb :show
  end

  get '/post/:id/edit' do

    erb :edit
  end

  patch '/post/:id' do
    binding.pry
    @post = Post.find_by_id(params[])

    erb :edit
  end
end
