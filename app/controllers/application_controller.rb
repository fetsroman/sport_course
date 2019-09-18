class ApplicationController < ActionController::Base
  before_action :set_locale, except: [:change_locale]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def change_locale
    if user_signed_in?
      current_user.update(locale: params[:locale])
      I18n.locale = current_user.locale
    else
      I18n.locale = params[:locale]
    end

    request.env['PATH_INFO']
    redirect_to("/" + I18n.locale.to_s + "/"+ params[:path].to_s)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :terms_and_conditions])
  end

  private

  def set_locale
    begin
      if user_signed_in? && I18n.available_locales.map(&:to_s).include?(current_user.locale)
        I18n.locale = current_user.locale
        if params[:locale] != current_user.locale
          redirect_to("/" + I18n.locale.to_s + "/"+ request.path.to_s.split("/").drop(2).join("/"))
        end
      elsif params[:locale].present?
        I18n.locale = params[:locale]
        # redirect_to("/" + I18n.locale.to_s + "/"+ request.path.to_s.split("/").drop(2).join("/"))
      else
        I18n.locale = I18n.default_locale
        redirect_to("/" + I18n.locale.to_s + "/"+ request.path.to_s.split("/").drop(2).join("/"))
      end
    rescue ActionController::RoutingError
      redirect_to root_path
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message, status: 401 }
    rescue SessionExpiredError => e
      render json: { errors: e.message, status: 401 }
    end
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

end
