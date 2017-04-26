require 'twilio-ruby'

class Notification < ApplicationRecord
  after_commit :notify_user

  def notify_user
    account_sid = 'ACf5be4b90940aa6da27f5d4409cbff8d3' # Your Account SID from www.twilio.com/user/account
    auth_token = '2dc66e0443c4a042c304aeacd0e6671b'   # Your Auth Token from www.twilio.com/user/account

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(
      from: '+17182606725 ',
      to: '+13076909993',
      body: name
    )
  end
end
