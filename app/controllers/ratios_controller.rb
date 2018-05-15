class RatiosController < ApplicationController
  before_action :set_ratio, only: [:show, :edit, :update, :destroy]

  # GET /ratios
  # GET /ratios.json
  def index
    @ratios = Ratio.all
  end

  # GET /ratios/1
  # GET /ratios/1.json
  def show
  end

  # GET /ratios/new
  def new
    @ratio = Ratio.new
  end

  # GET /ratios/1/edit
  def edit
  end

  # POST /ratios
  # POST /ratios.json
  def create
    @ratio = Ratio.new(ratio_params)

    respond_to do |format|
      if @ratio.save
        format.html { redirect_to @ratio, notice: 'Ratio was successfully created.' }
        format.json { render :show, status: :created, location: @ratio }
      else
        format.html { render :new }
        format.json { render json: @ratio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratios/1
  # PATCH/PUT /ratios/1.json
  def update
    respond_to do |format|
      if @ratio.update(ratio_params)
        format.html { redirect_to @ratio, notice: 'Ratio was successfully updated.' }
        format.json { render :show, status: :ok, location: @ratio }
      else
        format.html { render :edit }
        format.json { render json: @ratio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratios/1
  # DELETE /ratios/1.json
  def destroy
    @ratio.destroy
    respond_to do |format|
      format.html { redirect_to ratios_url, notice: 'Ratio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ratio
      @ratio = Ratio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ratio_params
      params.require(:ratio).permit(:currency_id, :value)
    end
end
