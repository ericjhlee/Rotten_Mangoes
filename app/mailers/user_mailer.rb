class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def bye_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Get Out of My Awesome Site')
  end

end
