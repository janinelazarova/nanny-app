class Api::BookingsController < ApplicationController
  before_action :authenticate_parent
  # before_action :set_nanny

  #this will go to parents_controller?
  def index
    @bookings = current_parent.bookings
    render 'index.json.jbuilder'  
  end

  # def new
  #   render 'new.html.erb'
  # end

  def create
    @booking = Booking.new(
      parent_id: current_parent.id,
      nanny_id: params[:nanny_id],
      hours: params[:hours],
      start_date: params[:start_date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      notes: params[:notes]
    )
    puts @booking.start_time
    if @booking.save
      render json: {message: 'Booking created successfully'}, status: :created
    else
      render json: {errors: @booking.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @booking = Booking.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @booking = Booking.find(params[:id])

    @booking.nanny_id = params[:nanny_id] || @booking.nanny_id
    @booking.hours = params[:hours] || @booking.hours
    @booking.start_date = params[:start_date] || @booking.start_date
    @booking.start_time = params[:start_time] || @booking.start_time
    @booking.end_time = params[:end_time] || @booking.end_time
    @booking.notes = params[:notes] || @booking.notes
   
    if @booking.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @booking.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    render json: {message: "Booking successfully deleted!"}
  end



  # def set_nanny
  #   @nanny = Nanny.find(params[:nanny_id])
  # end


end
