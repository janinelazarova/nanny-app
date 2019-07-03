class Api::NanniesSessionsController < ApplicationController
  def create
    nanny = Nanny.find_by(email: params[:email])
    if nanny && nanny.authenticate(params[:password])
      jwt = JWT.encode(
        {
          nanny_id: nanny.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: nanny.email, nanny_id: nanny.id}, status: :created
      else
        render json: {}, status: :unauthorized
    end
  end
  
end
