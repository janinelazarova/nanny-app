class Api::ReviewsController < ApplicationController
  # before_action :authenticate_nanny

  def index
    if current_parent
      @reviews = current_parent.reviews
      render 'index.json.jbuilder'
    elsif current_nanny
      @reviews = current_nanny.reviews
      render 'index.json.jbuilder'
    end
  end

  def create
    if current_parent
      @review = Review.new(
        parent_id: current_parent.id,
        nanny_id: params[:nanny_id],
        stars: params[:stars],
        comment: params[:comment]
      )
    end

    if @review.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @review.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @review = Review.find(params[:id])
    render 'show.json.jbuilder'
  end
  
  def update
    if current_parent
      @review = Review.find(params[:id])
    
      @review.stars = params[:stars] || @review.stars
      @review.comment = params[:comment] || @review.comment
    end

    if @review.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @booking.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    if current_parent
      @review = Review.find(params[:id])
      @review.destroy
      render json: {message: "Review successfully deleted!"}
    end
  end

end
