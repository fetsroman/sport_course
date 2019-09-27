class PaymentMailer < ApplicationMailer
  default to: "okamivan@gmail.com",
          from: "okamivan@gmail.com"

  def buy_vip(current_user, rate, course, currency)
    @user = current_user
    @rate = rate
    @course = course
    @currency = currency
    mail(subject: "В вас купили Vip пакет")
  end
end
