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

     end

     @pet.save
     @owner.save
    redirect to "/pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
