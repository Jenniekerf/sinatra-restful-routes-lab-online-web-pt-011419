class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes/new' do 
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index 
  end
  
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    
  end
  
  post '/recipes' do 
    @recipe = Recipe.create(params)
    @recipe.save
    redirect "/recipes/#{ @recipe.id }"
  end
  
   
  
  
  
  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:ingredients])
    redirect to "/recipes/#{ @recipe.id }"
  end
  
  delete '/recipes/:id' do 
    Recipe.destroy(params[:id])
  end

end
