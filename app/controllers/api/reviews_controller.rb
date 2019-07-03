class Api::ReviewsController < ApplicationController
  before_action :authenticate_parent

  def index
    @reviews = current_parent.reviews
    render 'index.json.jbuilder'  
  end

  def create
    @review = Review.new(
      parent_id: current_parent.id,
      nanny_id: params[:nanny_id],
      stars: params[:stars],
      comment: params[:comment]
      )
    if @review.save
      render json: {message: 'Review created successfully'}, status: :created
    else
      render json: {errors: @review.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @review = Review.find(params[:id])
    render 'show.json.jbuilder'
  end
  
  def update

    @review = Review.find(params[:id])
    # if current_parent.id == @review.parent_id

      @review.stars = params[:stars] || @review.stars
      @review.comment = params[:comment] || @review.comment


      @review.save
      render 'show.json.jbuilder'
    # else
    #   render json: {errors: @review.errors.full_messages}, status: :bad_request
    # end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render json: {message: "Review successfully deleted!"}
  end

end
