class ApplicationController < ActionController::Base
  force_ssl if: :ssl_configured?
  protect_from_forgery with: :exception

  before_action :current_cart

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: 'Please log in'
    end
  end

  def ssl_configured?
    Rails.env.production?
  end

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
end
