class PetsController < ApplicationController
  def create
    @pet = Pet.new(name: params[:name], 
                age: params[:age], 
                breed: params[:breed],
                user_id: params[:user_id])
    
    if @pet.save
      # render template: "products/show"
      render json: {message: "saved"}
    else
      # render json: {error: @product.errors.full_messages}
      render json: {error: "not saved"}
    end

  end
end
