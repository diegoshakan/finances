# frozen_string_literal: true

class SaveMoneysController < ApplicationController
  before_action :set_save_money, only: %i[show edit update destroy]

  # GET /save_moneys or /save_moneys.json
  def index
    @save_moneys = SaveMoney.where(user: current_user).group_by { |m| m.date.beginning_of_month }
  end

  # GET /save_moneys/1 or /save_moneys/1.json
  def show; end

  # GET /save_moneys/new
  def new
    @save_money = SaveMoney.new
  end

  # GET /save_moneys/1/edit
  def edit; end

  # POST /save_moneys or /save_moneys.json
  def create
    @save_money = SaveMoney.new(user_save_money_params)

    respond_to do |format|
      if @save_money.save
        format.html { redirect_to @save_money, notice: 'Save money was successfully created.' }
        format.json { render :show, status: :created, location: @save_money }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @save_money.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /save_moneys/1 or /save_moneys/1.json
  def update
    respond_to do |format|
      if @save_money.update(save_money_params)
        format.html { redirect_to @save_money, notice: 'Save money was successfully updated.' }
        format.json { render :show, status: :ok, location: @save_money }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @save_money.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /save_moneys/1 or /save_moneys/1.json
  def destroy
    @save_money.destroy
    respond_to do |format|
      format.html { redirect_to save_moneys_url, notice: 'Save money was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_save_money
    @save_money = SaveMoney.where(user: current_user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def save_money_params
    params.require(:save_money).permit(:title, :description)
  end

  def user_save_money_params
    save_money_params.merge({ user: current_user })
  end
end
