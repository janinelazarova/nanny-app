class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_nanny
    auth_headers = request.headers['Authorization']
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        Nanny.find_by(id: decoded_token[0]["nanny_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_nanny

  def authenticate_nanny
    unless current_nanny
      render json: {}, status: :unauthorized
    end
  end


  def current_parent
    auth_headers = request.headers['Authorization']
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        Parent.find_by(id: decoded_token[0]["parent_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_parent

  def authenticate_parent
    unless current_parent
      render json: {}, status: :unauthorized
    end
  end
end