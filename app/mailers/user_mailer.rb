class UserMailer < ActionMailer::Base
  default from: "Funk you 7 - Shop <shop@funkyou7.ru>"

  def new_user_from_order(user)
    @user = user
    mail(:to => user.email,
         :subject => I18n.t("activerecord.attributes.user_mailer.new_user_from_order_subject")
    )
  end

end
