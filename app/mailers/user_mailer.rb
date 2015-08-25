class UserMailer < ApplicationMailer
  default from: "octohellstore@gmail.com"

  def greeting_mail(user)
    @user = user

    mail to: user.email, subject: 'Спасибо что зарегистрировался, но это еще не всё!'

  end

end
