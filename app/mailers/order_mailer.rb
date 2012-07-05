class OrderMailer < ActionMailer::Base
  default from: "Funk you 7 - Shop <shop@funkyou7.ru>"

  def new_order(order)
    @order = order
    mail(:to => "#{order.user.email}, shop@funkyou7.ru",
         :subject => I18n.t("activerecord.attributes.order_mailer.new_order_subject")
    )
  end

end
