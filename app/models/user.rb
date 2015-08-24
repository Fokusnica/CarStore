class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  belongs_to :group_user
  belongs_to :cart
  after_update :send_another_spam_mail


  def send_another_spam_mail
    @user = self

    if @user.confirmed_at_changed?
      UserMailer.greeting_mail(@user.email).deliver_now
    end
  end

end
