# frozen_string_literal: true

class SaveMoneyWalletsController < ApplicationController
  before_action :set_save_money, only: %i[create edit update destroy]
  before_action :set_save_money_wallet, only: %i[edit update destroy]

  # GET /save_money_wallets/1 or /save_money_wallets/1.json
  def show; end

  # GET /save_money_wallets/1/edit
  def edit; end

  # POST /save_money_wallets or /save_money_wallets.json
  def create
    @save_money_wallet = @save_money.wallets.create(save_money_wallet_params)

    respond_to do |format|
      if @save_money_wallet.save
        format.html { redirect_to @save_money, notice: 'Save money wallet was successfully created.' }
        format.json { render :show, status: :created, location: @save_money_wallet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @save_money_wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /save_money_wallets/1 or /save_money_wallets/1.json
  def update
    respond_to do |format|
      if @save_money_wallet.update(save_money_wallet_params)
        format.html { redirect_to @save_money, notice: 'Save money wallet was successfully updated.' }
        format.json { render :show, status: :ok, location: @save_money_wallet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @save_money_wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /save_money_wallets/1 or /save_money_wallets/1.json
  def destroy
    @save_money_wallet.destroy
    respond_to do |format|
      format.html { redirect_to save_moneys_url, notice: 'Save money wallet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_save_money
    @save_money = SaveMoney.where(user: current_user).find(params[:save_money_id])
  end

  def set_save_money_wallet
    @save_money_wallet = @save_money.wallets.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def save_money_wallet_params
    params.require(:save_money_wallet).permit(:title, :description, :value, :date)
  end
end
