class InfonMailer < ActionMailer::Base
  default from: 'derschichtplan@gmail.com'
  layout 'mailer'

  # Mailfunktion bei anmeldung
  def info_email(mitarbeiter)
    @mitarbeiter = mitarbeiter
    mail(to: @mitarbeiter.email, subject: 'Änderung des Schichtplans')
  end
  end