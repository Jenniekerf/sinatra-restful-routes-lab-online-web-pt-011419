class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do 
    erb :index
    do

  get '/recipes' do
    @recipes = Recipe.all
    erb :index 
  end
  
  get '/recipes/new' do 
    @recipe = Recipe.new 
    @recipe.save
    erb :new
  end
  
   get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
  end

end
