class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_rate
  before_action :set_course
  before_action :can_buy?

  def bought_course
    @payment = Payment.new
    if request.post?
      @liqpay = ::Liqpay::Liqpay.new
      token = SecureRandom.urlsafe_base64.to_s

      card_month = params[:card_params][:card_date].split('/').first
      card_year = params[:card_params][:card_date].split('/').last

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
          card: params[:card_params][:card].to_s.gsub(' ', ''),
          card_exp_month: card_month.to_s,
          card_exp_year: card_year.to_s,
          card_cvv: params[:card_params][:card_cvv].to_s
      })

      if @liqpay_request['result'] == 'ok'  && @liqpay_request['currency'] == currency && @liqpay_request['order_id'] == token
        current_user.bought_lists.create!(user_id: current_user.id, course_id: @course.id, rate_id: @rate.id, currency: currency, price: @rate.price)
        @rate.increment_bought_count
        @course.lessons.each do |lesson|
          current_user.watched_lists.create!(user_id: current_user.id, course_id: @course.id, lesson_id: lesson.id)
        end
        first_lesson = WatchedList.where(user_id: current_user.id, course_id: @course.id).first
        first_lesson.watch = true
        first_lesson.save!

        PaymentMailer.buy_vip(current_user, @rate, @course, currency).deliver
        # respond_to do |format|
        #   format.html { redirect_to root_url }
        #   format.js #default behaviour is to run app/views/notes/create.js.erb file
        # end
        redirect_to my_courses_path, notice: "Thanks for buy"
      else
        # respond_to do |format|
        #   format.html { redirect_to root_url }
        #   format.js {@liqpay_request['err_description']}
        # end

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

  def can_buy?
    tmp = BoughtList.find_by(course_id: @course.id, user_id: current_user.id)
    if tmp.present?
      redirect_to root_path
    end
  end
end
