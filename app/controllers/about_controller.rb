class AboutController < ApplicationController
  layout false
  def index

  end

  def mail

    @client = params

    UserMailer.test_drive(@client).deliver_now

    redirect_to about_url
  end
end
