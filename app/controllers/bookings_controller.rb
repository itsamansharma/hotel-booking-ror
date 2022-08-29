class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
     if user_signed_in?
      @bookings = Booking.all
    else
      redirect_to '/'
    end
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  def owner_booking
      @booking = Booking.find(params[:property_id])
      
    # if @bookings.property_id? 
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json

  # if @message.save
  #   flash.now[:notice] = 'Message sent!'
  # else
  #   flash.now[:alert] = 'Error while sending message!'
  # end

  def create
    @booking = Booking.new(booking_params)

    if @booking.start_date && @booking.end_date

      if(@booking.start_date >= Date.today && @booking.end_date > @booking.start_date)
        flash.now[:alert] = "correct format"
        logger.info "this is correct format....."

        @booking.user_id=current_user.id

        respond_to do |format|
          if @booking.save
            format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
            format.json { render :show, status: :created, location: @booking }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @booking.errors, status: :unprocessable_entity }
          end
        end

      else 
        flash.now[:alert] = "wrong format"

        logger.info "this is wrong format....."
      end
    end


    
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      if !user_signed_in?
        redirect_to "/"
      end
      @booking = Booking.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:price, :start_date, :end_date, :property_id)
    end
end
