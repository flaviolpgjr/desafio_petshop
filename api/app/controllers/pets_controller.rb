class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index
    #@pets = Pet.all
    @suggests
    # Verifica se o usuário entrou com keywords
    if params[:keywords].present?
      # Diz ao elastickick para pesquisar as keyrwords nos campos name e description
      @pets = Pet.search params[:keywords], fields: [:name, :breed,:owner_name, :full_search], suggest: true
      @suggests = @pets.suggestions

    else
      @pets = Pet.search '*'
    end
    
    obj = {pets:@pets.sort_by{|e| e[:name]}, suggests:@suggests}
    
    render json: obj
  end

  # GET /pets/1
  def show
    render json: @pet
  end

  # POST /pets
  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      render json: @pet, status: :created, location: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pets/1
  def update
    if @pet.update(pet_params)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pet_params
      params.require(:pet).permit(:breed, :genre, :castrated, :birth, :name, :owner_name, :owner_phone, :last_time)
    end
end
