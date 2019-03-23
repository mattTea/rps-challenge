require 'sinatra/base'

class RockPaperScissors < Sinatra::Base
  enable :sessions
  
  get "/" do
    erb(:index)
  end

  post "/name" do
    session[:name] = params[:name]
    redirect("/play")
  end

  get "/play" do
    @name = session[:name]
    erb(:play)
  end

  post "/turn" do
    session[:turn] = ["Rock", "Paper", "Scissors"].sample
    redirect("/score")
  end

  get "/score" do
    @score = session[:turn]
  end

  run! if app_file == $0
end

# To run -> ruby app.rb