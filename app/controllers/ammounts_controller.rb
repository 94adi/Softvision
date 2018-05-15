class AmmountsController < ApplicationController
  before_action :authorize
  before_action :set_ammount, only: [:show, :edit, :update, :destroy]

  # GET /ammounts
  # GET /ammounts.json
  def index
    @ammounts = Ammount.all
  end

  # GET /ammounts/1
  # GET /ammounts/1.json
  def show
  end

  # GET /ammounts/new
  def new
    @ammount = Ammount.new
  end

  # GET /ammounts/1/edit
  def edit
  end

  # POST /ammounts
  # POST /ammounts.json
  def create
    @ammount = Ammount.new(ammount_params)

    respond_to do |format|
      if @ammount.save
        format.html { redirect_to @ammount, notice: 'Ammount was successfully created.' }
        format.json { render :show, status: :created, location: @ammount }
      else
        format.html { render :new }
        format.json { render json: @ammount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ammounts/1
  # PATCH/PUT /ammounts/1.json
  def update
    respond_to do |format|
      if @ammount.update(ammount_params)
        format.html { redirect_to @ammount, notice: 'Ammount was successfully updated.' }
        format.json { render :show, status: :ok, location: @ammount }
      else
        format.html { render :edit }
        format.json { render json: @ammount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ammounts/1
  # DELETE /ammounts/1.json
  def destroy
    @ammount.destroy
    respond_to do |format|
      format.html { redirect_to ammounts_url, notice: 'Ammount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ammount
      @ammount = Ammount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ammount_params
      params.require(:ammount).permit(:user_id, :quantity, :currency_id)
    end
end
