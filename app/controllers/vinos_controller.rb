class VinosController < ApplicationController
  before_action :set_vino, only: [:show, :edit, :update, :destroy]

  # GET /vinos
  # GET /vinos.json
  def index
    @vinos = Vino.all
  end

  # GET /vinos/1
  # GET /vinos/1.json
  def show
  end

  # GET /vinos/new
  def new
    @vino = Vino.new
  end

  # GET /vinos/1/edit
  def edit
  end

  # POST /vinos
  # POST /vinos.json
  def create
    @vino = Vino.new(vino_params)

    respond_to do |format|
      if @vino.save
        format.html { redirect_to @vino, notice: 'Vino was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vino }
      else
        format.html { render action: 'new' }
        format.json { render json: @vino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinos/1
  # PATCH/PUT /vinos/1.json
  def update
    respond_to do |format|
      if @vino.update(vino_params)
        format.html { redirect_to @vino, notice: 'Vino was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinos/1
  # DELETE /vinos/1.json
  def destroy
    @vino.destroy
    respond_to do |format|
      format.html { redirect_to vinos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vino
      @vino = Vino.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vino_params
      params.require(:vino).permit(:name, :discription)
    end
end
