class UserMailer < ApplicationMailer
  default from: "octohellstore@gmail.com"

  def greeting_mail(user_mail)

    mail to: user_mail, subject: 'Спасибо что зарегистрировался, но это еще не всё!'

  end

end
