class UserMailer < ApplicationMailer
  default from: "octohellstore@gmail.com"

  def greeting_mail(user)
    @user = user

    mail to: user.email, subject: 'Спасибо что зарегистрировался, но это еще не всё!'

  end

  def test_drive(client)

    @client = client

    mail to: "octohellstore@gmail.com", subject: 'Заявка на тест - драйв'

  end

end
