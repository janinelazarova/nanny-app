class Api::NanniesController < ApplicationController
   before_action :authenticate_nanny, except: [:create,:index,:show]
  
  def index
    @nannies = Nanny.all
    render 'index.json.jbuilder'
  end


  def create
    # PRINTS THE COORDINATES TO THE SERVER LOG!
      coordinates = Geocoder.coordinates(params[:address])
      p "===========================#{coordinates}" 

    @nanny = Nanny.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      address: params[:address],
      ages: params[:ages],
      specialization: params[:specialization],
      bio: params[:bio],
      image_url: params[:image_url],
      rate: params[:rate],
      education: params[:education],
      # latitude: nil,
      # longitude: nil

      latitude: coordinates[0],
      longitude: coordinates[1]
      )
    if @nanny.save
      render json: {message: 'Nanny created successfully'}, status: :created
    else
      render json: {errors: nanny.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @nanny = Nanny.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @nanny = Nanny.find(params[:id])

    @nanny.email = params[:email] || @nanny.email
    @nanny.first_name = params[:first_name] || @nanny.first_name
    @nanny.last_name = params[:last_name] || @nanny.last_name
    @nanny.phone_number = params[:phone_number] || @nanny.phone_number
    @nanny.address = params[:address] || @nanny.address
    @nanny.ages = params[:ages] || @nanny.ages
    @nanny.specialization = params[:specialization] || @nanny.specialization
    @nanny.bio = params[:bio] || @nanny.bio
    @nanny.image_url = params[:image_url] || @nanny.image_url
    @nanny.rate = params[:rate] || @nanny.rate
    @nanny.education = params[:education] || @nanny.education
    # @nanny.latitude = @nanny.latitude
    # @nanny.longitude = @nanny.longitude


        
    coordinates = Geocoder.coordinates(params[:address])
    p "===========================#{coordinates}" 

    @nanny.latitude = coordinates[0] || @nanny.latitude
    @nanny.longitude = coordinates[1] || @nanny.longitude

    if @nanny.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @nanny.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @nanny = Nanny.find(params[:id])
    @nanny.destroy 
  end

end
