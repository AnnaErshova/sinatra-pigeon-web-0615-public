# create your PigeonsController here
# it should inherit from ApplicationController

class PigeonsController < ApplicationController

  get '/pigeons' do
    erb :"pigeons/index"
  end
  # renders the pigeon index template
  # list all projects
    #  pigeon = Pigeon.new
    #pigeon.name = params[:name]
    #pigeon.color = params[:name]
    #pigeon.gender = params[:name]
    #pigeon.lives = params[:name]
    #pigeon.save

  get '/pigeons/new' do # new comes before :id
    erb :"pigeons/new"
  end 
    
  get '/pigeons/:id' do |id|
    @pigeon = Pigeon.find(id)
    erb :"pigeons/show"
  end
  # renders the show page for the pigeons's list of attributes
  # shows a particular project

  # renders the new pigeon form
  # expected "" to include "</form>"

  get '/pigeons/:id/edit' do |id|
    @pigeon = Pigeon.find(id)
    erb :"pigeons/edit"
  end
  # renders the edit page for the pigeon

  post '/pigeons' do
    Pigeon.create(params)
    redirect '/pigeons'
  end

  #
  delete '/pigeons/:id' do |id|
    Pigeon.destroy(id)
    redirect '/pigeons'
  end

  patch '/pigeons/:id' do |id|
    Pigeon.update(id, {name: params[:name], color: params[:color], gender: params[:gender], lives: params[:lives]})
    redirect "/pigeons/#{id}"
  end

end

