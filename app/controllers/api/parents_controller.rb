class Api::ParentsController < ApplicationController
   before_action :authenticate_parent, except: [:create]


  def create
    @parent = Parent.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      address: params[:address]
      )
    if @parent.save
      render json: {message: 'Parent created successfully'}, status: :created
    else
      render json: {errors: parent.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @parent = Parent.find(params[:id])
    @bookings = @parent.bookings
    render 'show.json.jbuilder'
  end

  def update
    @parent = Parent.find(params[:id])

    @parent.email = params[:email] || @parent.email
    @parent.first_name = params[:first_name] || @parent.first_name
    @parent.last_name = params[:last_name] || @parent.last_name
    @parent.phone_number = params[:phone_number] || @parent.phone_number
    @parent.address = params[:address] || @parent.address

    if @parent.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @parent.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy 
  end

end
