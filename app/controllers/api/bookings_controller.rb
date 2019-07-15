class Api::BookingsController < ApplicationController
  # before_action :authenticate_parent

  def index
    if current_parent
      @bookings = current_parent.bookings
    # @bookings = Booking.all
      render 'index.json.jbuilder'
    elsif current_nanny
      @bookings = current_nanny.bookings
      render 'index.json.jbuilder'
    end
  end

  def create
    if current_parent
      @booking = Booking.new(
        parent_id: current_parent.id,
        nanny_id: params[:nanny_id],
        hours: params[:hours],
        start_date: params[:start_date],
        start_time: params[:start_time],
        end_time: params[:end_time],
        notes: params[:notes]
      )
    end

    if @booking.save
      render json: {message: 'Booking created successfully'}, status: :created
    else
      render json: {errors: @booking.errors.full_messages}, status: :bad_request
    end
  end

  def show
    if current_parent || current_nanny
      @booking = Booking.find(params[:id])
      render 'show.json.jbuilder'
    end
  end

  def update
    if current_parent || current_nanny
      @booking = Booking.find(params[:id])

      @booking.hours = params[:hours] || @booking.hours
      @booking.start_date = params[:start_date] || @booking.start_date
      @booking.start_time = params[:start_time] || @booking.start_time
      @booking.end_time = params[:end_time] || @booking.end_time
      @booking.notes = params[:notes] || @booking.notes
    end
     
    if @booking.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @booking.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    if current_parent || current_nanny
      @booking = Booking.find(params[:id])
      @booking.destroy
      render json: {message: "Booking successfully deleted!"}
    end
  end

end
