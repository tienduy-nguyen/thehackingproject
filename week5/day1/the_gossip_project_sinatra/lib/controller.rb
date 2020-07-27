require_relative 'gossip.rb'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    # set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  # Home page
  get '/' do
    erb:index ,locals: {gossips: Gossip.all.reverse}
  end

  # GET page of creating a new gossip
  get '/gossips/new/' do
    erb:new_gossip
  end

  # Create a new gossip
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end

  # Get detail of potin
  get '/gossips/:id/' do
    id = params['id'].to_i
    p params
    p params['id']
    erb:show ,locals: {gossip: Gossip.all[id], id: id}
  end

  # Get edit
  get '/gossips/:id/edit/' do
    id = params['id'].to_i
    erb:edit_gossip ,locals: {gossip: Gossip.all[id], id: id}
  end

  # Post edit
  post '/gossips/:id/edit/' do
    id = params['id'].to_i
    potin = Hash.new
    potin["author"] = params['gossip_author']
    potin["content"]= params['gossip_content']
    gossips = Gossip.all
    gossips[id] = potin
    Gossip.save_new(gossips)
    redirect '/'
  end

  # Delete
  post '/gossips/:id/' do
    id = params['id'].to_i
    gossips = Gossip.all
    gossips.delete_at(params['id'].to_i);
    Gossip.save_new(gossips)
    redirect '/'
  end
end