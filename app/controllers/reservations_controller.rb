class ReservationsController < ApplicationController

  # GET /reservations
  def index
    @reservations = Reservation.order(:slot).all
  end

  # GET /reservations/1
  def show
    @reservation = Reservation.find(params[:id])
  end

  # GET /reservations/new
  def new
    @reservation = current_user.reservations.new
  end

  # GET /reservations/1/edit
  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  # POST /reservations
  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.slot = DateTime.parse(@reservation.slotdate.to_s + " " + @reservation.slothour.to_s + ":00:00")

   begin
    if @reservation.save
      redirect_to @reservation, notice: 'Reservation was successfully created.'
    else
      render :new 
    end
   rescue 
       flash[:error] = "That time slot is already taken."
      render :new
   end
  end

  # PATCH/PUT /reservations/1
  def update
    @reservation = current_user.reservations.find(params[:id])
    begin
    if @reservation.update(reservation_params)
      @reservation.slot = DateTime.parse(@reservation.slotdate.to_s + " " + @reservation.slothour.to_s + ":00:00")
      if @reservation.save
         redirect_to @reservation, notice: 'Reservation was successfully updated.' 
      end
    else
      render :edit 
    end
    rescue
	flash[:error] = "That time slot is already taken."
	render :edit
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy
      redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' 
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:slotdate, :slothour, :eventname, :eventtype)
    end
end
