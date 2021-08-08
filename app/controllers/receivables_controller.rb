class ReceivablesController < ApplicationController
  before_action :set_receivable, only: %i[ show edit update destroy ]

  # GET /receivables or /receivables.json
  def index
    @receivables = Receivable.all
  end

  # GET /receivables/1 or /receivables/1.json
  def show
  end

  # GET /receivables/new
  def new
    @receivable = Receivable.new
  end

  # GET /receivables/1/edit
  def edit
  end

  # POST /receivables or /receivables.json
  def create
    @receivable = Receivable.new(receivable_params)

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
      @receivable = Receivable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receivable_params
      params.require(:receivable).permit(:title, :description, :value, :date)
    end
end
