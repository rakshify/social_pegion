class TravellersController < ApplicationController
  before_action :set_traveller, only: [:show, :edit, :update, :destroy]

  # GET /travellers
  # GET /travellers.json
  def index
    @travellers = Traveller.all
  end

  # GET /travellers/1
  # GET /travellers/1.json
  def show
  end

  # GET /travellers/new
  def new
    @traveller = Traveller.new
  end

  # GET /travellers/1/edit
  def edit
  end

  # POST /travellers
  # POST /travellers.json
  def create
    @traveller = Traveller.new(traveller_params)

    respond_to do |format|
      if @traveller.save
        format.html { redirect_to @traveller, notice: 'Traveller was successfully created.' }
        format.json { render action: 'show', status: :created, location: @traveller }
      else
        format.html { render action: 'new' }
        format.json { render json: @traveller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travellers/1
  # PATCH/PUT /travellers/1.json
  def update
    respond_to do |format|
      if @traveller.update(traveller_params)
        format.html { redirect_to @traveller, notice: 'Traveller was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @traveller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travellers/1
  # DELETE /travellers/1.json
  def destroy
    @traveller.destroy
    respond_to do |format|
      format.html { redirect_to travellers_url }
      format.json { head :no_content }
    end
  end
  
  
  
  def filter_results
    sender = Sender.find_by id: params[:id]
    @travellers = Traveller.where(:travelling_from => sender[:send_from], :travelling_to => sender[:send_to], :travel_date => Date.today .. (Date.today + sender[:send_date_range].days))
    
    @hash = {:sender => sender, :travellers => @travellers}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traveller
      @traveller = Traveller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traveller_params
      params.require(:traveller).permit(:name, :phone_number, :email, :address, :travelling_from, :travelling_to, :travel_date, :conditions)
    end
end
