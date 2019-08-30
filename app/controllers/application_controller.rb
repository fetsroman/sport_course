class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    # I18n.locale = extract_locale || I18n.default_locale

    valid_locales = ['uk','ru']

    if !params[:locale].nil? && valid_locales.include?(params[:locale])
      I18n.locale=params[:locale]
      if user_signed_in?
        current_user.update_attribute(:locale,I18n.locale)
      end
    elsif user_signed_in? && valid_locales.include?(current_user.locale)
      I18n.locale = current_user.locale
    else
      I18n.locale = I18n.default_locale
    end
  end

  # def extract_locale
  #   parsed_locale = params[:locale]
  #   I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  # end
  #
  # def default_url_options
  #   { locale: I18n.locale }
  # end
end
