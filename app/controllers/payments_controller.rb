class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    payments = Payment.where(user: current_user)
    @calendar, @pagy, @payments = pagy_calendar(payments.reorder(date: :desc),
                                                year:  { size:  [1, 1, 1, 1], order: :desc },
                                                month: { size:  [0, 12, 12, 0], order: :desc, format: "%B" },
                                                pagy:  { items: 10 },
                                                )
  end

  # GET /payments/1 or /payments/1.json
  def show; end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit; end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(user_payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(user_payment_params)
        format.html { redirect_to @payment, notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_payment
    @payment = Payment.where(user: current_user).find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:title, :description, :value, :date)
  end

  def user_payment_params
    payment_params.merge({ user: current_user })
  end

  def pagy_calendar_period(collection)
    to_time = collection.minmax.map(&:date)
    to_time.map { |time| time.to_time }
  end

  def pagy_calendar_filter(collection, from, to)
    collection.where(date: from.utc..to.utc)  # storage in UTC
  end
end
