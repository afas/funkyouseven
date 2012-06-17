ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "funkyou7.ru",
    :user_name            => "shop@funkyou7.ru",
    :password             => "dhtvtybytn",
    :authentication       => "plain",
    :enable_starttls_auto => true
}