# it should inherit from ApplicationController
class PigeonsController < ApplicationController

  # renders the pigeon index template / list all project
  get '/pigeons' do
    erb :"pigeons/index"
  end

    #pigeon = Pigeon.new
    #pigeon.name = params[:name]
    #pigeon.color = params[:color]
    #pigeon.gender = params[:name]
    #pigeon.lives = params[:name]
    #pigeon.save

  # /new comes before /:id; gets messed up otherwise
  get '/pigeons/new' do 
    erb :"pigeons/new"
  end 
  
  # shows attributes of one pigeon
  get '/pigeons/:id' do |id|
    @pigeon = Pigeon.find(id)
    erb :"pigeons/show"
  end

  # renders edit page for one pigeon
  get '/pigeons/:id/edit' do |id|
    @pigeon = Pigeon.find(id)
    erb :"pigeons/edit"
  end

  post '/pigeons' do
    Pigeon.create(params)
    redirect '/pigeons'
  end

  delete '/pigeons/:id' do |id|
    Pigeon.destroy(id)
    redirect '/pigeons'
  end

  patch '/pigeons/:id' do |id|
    Pigeon.update(id, {
      name: params[:name], 
      color: params[:color], 
      gender: params[:gender], 
      lives: params[:lives]})
    redirect "/pigeons/#{id}"
  end

end

