class Api::ParentsSessionsController < ApplicationController
  def create
    parent = Parent.find_by(email: params[:email])
    if parent && parent.authenticate(params[:password])
      jwt = JWT.encode(
        {
          parent_id: parent.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: parent.email, parent_id: parent.id, parentname: parent.first_name}, status: :created
      else
        render json: {}, status: :unauthorized
    end
  end
end
