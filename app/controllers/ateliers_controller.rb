class AteliersController < ApplicationController
  before_action :set_atelier, only: [:show, :edit, :update, :destroy]

  # GET /ateliers
  # GET /ateliers.json
  def index
    @ateliers = Atelier.all
  end

  # GET /ateliers/1
  # GET /ateliers/1.json
  def show
  end

  # GET /ateliers/new
  def new
    @atelier = Atelier.new
  end

  # GET /ateliers/1/edit
  def edit
  end

  # POST /ateliers
  # POST /ateliers.json
  def create
    @atelier = Atelier.new(atelier_params)

    respond_to do |format|
      if @atelier.save
        format.html { redirect_to @atelier, notice: 'Atelier was successfully created.' }
        format.json { render :show, status: :created, location: @atelier }
      else
        format.html { render :new }
        format.json { render json: @atelier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ateliers/1
  # PATCH/PUT /ateliers/1.json
  def update
    respond_to do |format|
      if @atelier.update(atelier_params)
        format.html { redirect_to @atelier, notice: 'Atelier was successfully updated.' }
        format.json { render :show, status: :ok, location: @atelier }
      else
        format.html { render :edit }
        format.json { render json: @atelier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ateliers/1
  # DELETE /ateliers/1.json
  def destroy
    @atelier.destroy
    respond_to do |format|
      format.html { redirect_to ateliers_url, notice: 'Atelier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atelier
      @atelier = Atelier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atelier_params
      params.require(:atelier).permit(:titre, :presente_par, :entreprise, :salle_id, :heure_debut, :heure_fin)
    end
end
