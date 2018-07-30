class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do

    @pet = Pet.create(name: params[:pet][:name], owner_id: params[:owner_id])
   #binding.pry
     if !params["owner_name"].empty?
       @owner = Owner.create(name: params[:owner_name])
       @pet.owner_id = @owner.id
       @owner.save
     end

     @pet.save

    redirect to "/pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find_by_id(params[:id])
    erb :'/pets/edit'
  end

  get '/pets/:id' do
    @pet = Pet.find_by_id(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
      binding.pry
    @pet = Pet.find_by(params[:id])

    #@pet.update(params["owner"])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect to "pets/#{@pet.id}"
  end
end
