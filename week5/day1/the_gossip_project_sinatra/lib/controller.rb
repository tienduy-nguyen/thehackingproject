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
    id = params['id']
    gossip = Gossip.all.select{|x| x['id'] == id}[0]
    erb:show ,locals: {gossip: gossip, id: id}
  end

  # Get edit
  get '/gossips/:id/edit/' do
    id = params['id']
    gossip = Gossip.all.select{|x| x['id'] == id}[0]
    erb:edit_gossip ,locals: {gossip: gossip, id: id}
  end

  # Post edit
  post '/gossips/:id/edit/' do
    id = params['id']
    gossip = Gossip.all.select{|x| x['id'] == id}[0]
    gossip["author"] = params['gossip_author']
    gossip["content"]= params['gossip_content']
    update_at = Time.now.strftime("%d/%m/%y %k:%M:%S")
    gossip["update_at"] = update_at
    gossips = Gossip.all.map{|x| x['id']==id ? gossip : x}
    Gossip.save_new(gossips)
    redirect '/'
  end

  # Delete
  post '/gossips/:id/' do
    id = params['id']
    gossips = Gossip.all.reject{|x| x['id'] == id};
    Gossip.save_new(gossips)
    redirect '/'
  end

  # Get all authors
  get '/authors/' do
    list_authors = Gossip.all.map{|x| x['author']}
    erb:authors, locals: {authors: list_authors}
  end

  # Get all posts of author
  get '/author/:name/' do
    name=params['name']
    erb:author, locals: {author: name, gossips: Gossip.all.select{|x| x['author'] == name}}
  end

  # 
  # Post comments
  post '/comments/:id' do
    id = params['id']
    gossip = Gossip.find_by_uuid(id)
    new_comment = Hash.new
    new_comment['author'] = params['comment_author']
    new_comment['comment'] = params['comment_content']
    gossip['comments'].push(new_comment)
    gossips = Gossip.all.map{|x| x['id']==id ? gossip : x}
    Gossip.save_new(gossips)
    redirect ('/gossips/' + id + '/')
  end
end