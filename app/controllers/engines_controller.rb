class EnginesController < ApplicationController
  before_action :set_engine, only: %i[ show edit update destroy ]
  #Se le solicita al usuario estar autenticado para ver las vistas
  before_action :authenticate_user!
  before_action :set_features, only: %i[ new edit create update]
  #A través de este before_action logramos que solo el adminstrador pueda realizar el crud
  before_action only: [ :create, :new, :edit, :update, :destroy ] do
    authorize_request(["admin"])
   end
  # GET /engines or /engines.json
  def index
    #Paginacion pagy
    @pagy, @engines = pagy(Engine.all, items: 10)
  end

  # GET /engines/1 or /engines/1.json
  def show
  end

  # GET /engines/new
  def new
    @engine = Engine.new
  end

  # GET /engines/1/edit
  def edit
  end

  # POST /engines or /engines.json
  def create
    @engine = Engine.new(engine_params)

    respond_to do |format|
      if @engine.save
        format.html { redirect_to engine_url(@engine), notice: "Engine was successfully created." }
        format.json { render :show, status: :created, location: @engine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engines/1 or /engines/1.json
  def update
    respond_to do |format|
      if @engine.update(engine_params)
        format.html { redirect_to engine_url(@engine), notice: "Engine was successfully updated." }
        format.json { render :show, status: :ok, location: @engine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engines/1 or /engines/1.json
  def destroy
    @engine.destroy

    respond_to do |format|
      format.html { redirect_to engines_url, notice: "Engine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engine
      @engine = Engine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def engine_params
      params.require(:engine).permit(:name, :description, :feature_id, :image)
    end

    def set_features
    @features = Feature.all
    end 
end
