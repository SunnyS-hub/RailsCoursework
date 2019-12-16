class ApplicationMailer < ActionMailer::Base
  default to: "admin@liblocker.com", from: "user@lib.info.com"
  layout 'mailer'
end
