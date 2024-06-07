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
    if current_user

      @pet = Pet.new(name: params[:name], 
                  age: params[:age], 
                  breed: params[:breed],
                  user_id: current_user.id)
      
        if @pet.save
          render template: "pets/show"
          # render json: {message: "#{current_user.id}"}
        else
          render json: {error: @product.errors.full_messages}
          # render json: {error: "not saved"}
        end
    else
      render json: {error: "log in"}
   
    end  
  end
end
