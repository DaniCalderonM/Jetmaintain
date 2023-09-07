class UpkeepsController < ApplicationController
  before_action :set_upkeep, only: %i[ show edit update destroy ]
  #Se le solicita al usuario estar autenticado para ver las vistas
  before_action :authenticate_user!
  before_action :set_cities, only: %i[ new edit create update]
  before_action :set_engines, only: %i[ new edit create update]
  before_action :set_upkeeptipes, only: %i[ new edit create update]
  before_action :set_materials, only: %i[ new edit create update]
  before_action :set_features, only: %i[ new edit create update]
    #A través de este before_action logramos que solo el adminstrador pueda realizar estas acciones
  before_action only: [ :destroy, :edit, :update ] do
    authorize_request(["admin"])
  end
     #A través de este before_action logramos que el adminstrador y el operador puedan realizar
     #estas acciones
  before_action only: [ :create, :new ] do
    authorize_request(["admin","operator"])
  end
  # GET /upkeeps or /upkeeps.json
  def index
    #Paginacion pagy
    @pagy, @upkeeps = pagy(Upkeep.all, items: 10)
  end

  # GET /upkeeps/1 or /upkeeps/1.json
  def show
  end

  # GET /upkeeps/new
  def new
    @upkeep = Upkeep.new
    @upkeep.materials.build
  end

  # GET /upkeeps/1/edit
  def edit
  end

  # POST /upkeeps or /upkeeps.json
  def create
    @upkeep = Upkeep.new(upkeep_params)

    respond_to do |format|
      if @upkeep.save
        format.html { redirect_to upkeep_url(@upkeep), notice: "Upkeep was successfully created." }
        format.json { render :show, status: :created, location: @upkeep }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @upkeep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upkeeps/1 or /upkeeps/1.json
  def update
    respond_to do |format|
      if @upkeep.update(upkeep_params)
        format.html { redirect_to upkeep_url(@upkeep), notice: "Upkeep was successfully updated." }
        format.json { render :show, status: :ok, location: @upkeep }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @upkeep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upkeeps/1 or /upkeeps/1.json
  def destroy
    @upkeep.destroy

    respond_to do |format|
      format.html { redirect_to upkeeps_url, notice: "Upkeep was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upkeep
      @upkeep = Upkeep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upkeep_params
      params.require(:upkeep).permit(:date, :email, :city_id, :upkeeptipe_id, :engine_id, {material_ids: []}, materials_attributes: [:id, :name])
    end

    def set_cities
      @cities = City.all
    end

    def set_engines
      @engines = Engine.all
    end

    def set_upkeeptipes
      @upkeeptipes = Upkeeptipe.all
    end

    def set_materials
      @materials = Material.all
    end

    def set_features
      @features = Feature.all
    end
end
