class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    I18n.locale =  extract_locale || I18n.default_locale

    valid_locales = ['uk','ru']

    if user_signed_in? && valid_locales.include?(current_user.locale)
      I18n.locale = current_user.locale
    elsif !params[:locale].nil? && valid_locales.include?(params[:locale])
      I18n.locale = params[:locale]
      if user_signed_in?
        current_user.update_attribute(:locale,I18n.locale)
      end
    else
      I18n.locale = I18n.default_locale
    end
# return 'uk'
end
    def extract_locale
      parsed_locale = params[:locale]
      I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
    end

    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end

end
