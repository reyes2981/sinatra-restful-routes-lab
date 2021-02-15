class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") } #need to find out what this does

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do #loads new form
    erb :new
  end

  get '/recipes' do #loads index page
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do  #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

end
