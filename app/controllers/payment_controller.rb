class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_rate
  before_action :set_course

  def new
  end

  def bought_course
    if request.post?
      @liqpay = ::Liqpay::Liqpay.new
      token = SecureRandom.urlsafe_base64.to_s

      if I18n.locale == :uk
        currency = "UAH"
      elsif I18n.locale == :ru
        currency = "RUB"
      end

      if @rate.bought_count % 2 == 0
        receiver_card = ENV['CARD_1']
      else
        receiver_card = ENV['CARD_2']
      end

      @liqpay_request = @liqpay.api("request", {
          action: "p2p",
          version: "3",
          amount: @rate.price,
          currency: currency.to_s,
          description: "Дякуємо за покупку, за допомогою нашого сервісу!",
          order_id: token,
          receiver_card: receiver_card.to_s,
          card: params[:card_params][:card].to_s,
          card_exp_month: params[:card_params][:card_month].to_s,
          card_exp_year: params[:card_params][:card_year].to_s,
          card_cvv: params[:card_params][:card_cvv].to_s
      })

      if @liqpay_request['result'] == 'ok'  && @liqpay_request['currency'] == currency && @liqpay_request['order_id'] == token
        current_user.bought_lists.create!(user_id: current_user.id, course_id: @course.id)
        @rate.increment_bought_count
        redirect_to @course, notice: "Thanks for buy"
      else
        flash[:alert] = @liqpay_request['err_description']
        render :bought_course
        # render json: @liqpay_request['err_description']
      end
    end
  end

  private

  def set_rate
    @rate = Rate.find(params[:rate_id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
