# Preview all emails at http://localhost:3000/rails/mailers/recap_mailer
class RecapMailerPreview < ActionMailer::Preview
  def recap
    user = User.first
    # This is how you pass value to params[:user] inside mailer definition!
    RecapMailer.with(user: user).recap
  end
end
