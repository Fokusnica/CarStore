# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def greeting_mail
    UserMailer.greeting_mail('servermed@gmail.com')
  end
  def test_drive
    UserMailer.test_drive('servermed@gmail.com')
  end


end
