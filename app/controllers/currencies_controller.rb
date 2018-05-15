class CurrenciesController < ApplicationController
  before_action :authorize
  before_action :set_currency, only: [:open_modal, :buy, :show, :edit, :update, :destroy]

  # GET /currencies
  # GET /currencies.json
  def index
    @currencies = Currency.where.not(default: true)
  end

  # GET /currencies/1
  # GET /currencies/1.json
  def show
  end

  def set_ammount

  end


  def get_currency_data

  final_array = []
  current_user.ammounts.each do |a|
    
      quantity = a.quantity * a.currency.price.round(3)
      currency_name = a.currency.name
      final_array << [currency_name,quantity]
    
    end
      render json: { stats: final_array }
  end


  def buy
    
    original_currency_amount    = params[:original_currency_ammount]
    final_currency_ammount = params[:final_currency_ammount]
    original_currency_id = params[:original_currency_id]
    final_currency_id = @currency.id
             
    original_ammount_remain = original_currency_amount.to_f-((final_currency_ammount.to_f * @currency.price(Currency.find(original_currency_id))).round(3))

    if(original_ammount_remain == 0)
        Ammount.where("user_id = ? AND currency_id = ?", current_user.id, original_currency_id).delete_all
      else
        Ammount.where("user_id = ? AND currency_id = ?", current_user.id, original_currency_id).update(quantity: original_ammount_remain)
      end


    if Ammount.where("user_id = ? AND currency_id = ?", current_user.id, final_currency_id).blank?
      Ammount.create(
        user_id: current_user.id,
        quantity: final_currency_ammount.to_f,
        currency_id: @currency.id
        )
    else
        existing_ammount = Ammount.where("user_id = ? AND currency_id = ?", current_user.id, @currency.id).pluck(:quantity).first.to_f
        Ammount.where("user_id = ? AND currency_id = ?", current_user.id, @currency.id).update(quantity: final_currency_ammount.to_f + existing_ammount)
    end
 
  Transaction.create(user_id: current_user.id, original_currency_id: original_currency_id, original_currency_ammount: original_currency_amount, final_currency_id: final_currency_id, final_currency_ammount: final_currency_ammount)

    redirect_to currencies_path, notice: 'Successfully bought some coins!'
  end

  # GET /currencies/new
  def new
    @currency = Currency.new
  end

  def open_modal
    @ammount = params[:quantity].to_f
    render :partial => 'render_modal'
  end

  # GET /currencies/1/edit
  def edit
  end

  # POST /currencies
  # POST /currencies.json
  def create
    @currency = Currency.new(currency_params)

    respond_to do |format|
      if @currency.save
        format.html { redirect_to @currency, notice: 'Currency was successfully created.' }
        format.json { render :show, status: :created, location: @currency }
      else
        format.html { render :new }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currencies/1
  # PATCH/PUT /currencies/1.json
  def update
    respond_to do |format|
      if @currency.update(currency_params)
        format.html { redirect_to @currency, notice: 'Currency was successfully updated.' }
        format.json { render :show, status: :ok, location: @currency }
      else
        format.html { render :edit }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currencies/1
  # DELETE /currencies/1.json
  def destroy
    @currency.destroy
    respond_to do |format|
      format.html { redirect_to currencies_url, notice: 'Currency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_params
      params.require(:currency).permit(:name, :symbol, :default)
    end
    def verify_user
  redirect_to '/login' unless current_user 
end
end
