class PetsController < ApplicationController
  
  def index
    p current_user
    @pets = Pet.all
    # render json:{mesg: "all products"}
    render template: "pets/index"
  end

  def show
    #render json:{msg: "one product"}
    @pet = Pet.find_by(id: params[:id])
    render template: "pets/show"
  end
  
  
  def create
    @pet = Pet.new(name: params[:name], 
                age: params[:age], 
                breed: params[:breed],
                user_id: params[:user_id])
    
    if @pet.save
      # render template: "products/show"
      render json: {message: "#{current_user.id}"}
    else
      # render json: {error: @product.errors.full_messages}
      render json: {error: "not saved"}
    end

  end
end
