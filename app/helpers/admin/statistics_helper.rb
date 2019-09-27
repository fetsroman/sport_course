module Admin::StatisticsHelper
  def currency
    if params[:locale].to_s == "uk"
      return "UAH"
    elsif params[:locale].to_s == "ru"
      return "RUB"
    end
  end
end
