class ReceivablesController < ApplicationController
  before_action :set_receivable, only: %i[ show edit update destroy ]

  # GET /receivables or /receivables.json
  def index
    receivables = Receivable.where(user: current_user)
    @calendar, @pagy, @receivables = pagy_calendar(receivables,
                                                year:  { size:  [1, 1, 1, 1], order: :desc },
                                                month: { size:  [0, 12, 12, 0], order: :desc },
                                                pagy:  { items: 10 },
                                                )
  end

  # GET /receivables/1 or /receivables/1.json
  def show; end

  # GET /receivables/new
  def new
    @receivable = Receivable.new
  end

  # GET /receivables/1/edit
  def edit; end

  # POST /receivables or /receivables.json
  def create
    @receivable = Receivable.new(user_receivable_params)

    respond_to do |format|
      if @receivable.save
        format.html { redirect_to @receivable, notice: "Receivable was successfully created." }
        format.json { render :show, status: :created, location: @receivable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receivables/1 or /receivables/1.json
  def update
    respond_to do |format|
      if @receivable.update(receivable_params)
        format.html { redirect_to @receivable, notice: "Receivable was successfully updated." }
        format.json { render :show, status: :ok, location: @receivable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receivables/1 or /receivables/1.json
  def destroy
    @receivable.destroy
    respond_to do |format|
      format.html { redirect_to receivables_url, notice: "Receivable was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_receivable
    @receivable = Receivable.where(user: current_user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def receivable_params
    params.require(:receivable).permit(:title, :description, :value, :date)
  end

  def user_receivable_params
    receivable_params.merge({ user: current_user })
  end

  def pagy_calendar_period(collection)
    to_time = collection.minmax.map(&:date)
    to_time.map { |time| time.to_time }
  end

  def pagy_calendar_filter(collection, from, to)
    collection.where(date: from.utc..to.utc)  # storage in UTC
  end
end
