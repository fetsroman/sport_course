class ApplicationController < ActionController::Base
  before_action :extract_locale, except: [:change_locale]

  def change_locale
    if current_user
      current_user.update(locale: params[:locale])
      I18n.locale = current_user.locale
    else
      I18n.locale = params[:locale]
    end

    request.env['PATH_INFO']
    redirect_to("/" + I18n.locale.to_s + "/"+ params[:path].to_s)
  end

  private

  def set_locale
    I18n.locale =  extract_locale
  end

  def extract_locale
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
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

end
