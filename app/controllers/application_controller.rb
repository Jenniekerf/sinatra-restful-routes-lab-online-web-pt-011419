class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do 
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index 
  end
  
  get '/recipes/new' do 
    @recipe = Recipe.new 
    @recipe.save
    erb :new
  end
  
  post '/recipes' do 
    @recipe = Recipe.create(params)
    @recipe.save
    redirect "/recipes/#{ @recipe.id }"
  end
  
   get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
  end
  
  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:ingredients])
    redirect to "/recipes/#{ @recipe.id }"
  end
  
  delete '/recipes/:id' do 
    Recipe.destroy(params[:id])
    redirect to "/art"
  end

end
