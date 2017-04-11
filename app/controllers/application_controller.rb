class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception                                                                                 #Schutz vor Hacking durch verify_authenticity_token

  #definiert, ob ein Nutzer eingeloggt ist oder nicht
  private
  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user

  def userlogin
    if current_user.nil?                                                                                                #falls nicht eingeloggt
      redirect_to root_path                                                                                             #leite weiter auf Anmeldeseite
    else
    end
  end

  def authorizemanager
    if current_user.rechte != "Manager"                                                                                 #falls reche nicht manager
      redirect_to starta_path, notice: "Nur der Manager hat auf diese Aktion Zugriff!"                                  #leite weiter auf start
    end
  end


  def authorize
      if @mitarbeiter && @mitarbeiter.user != current_user.nachname && current_user.rechte != "Manager"
        redirect_to starta_path, notice: "Nur #{@mitarbeiter.user} hat auf diese Aktion Zugriff."
      end
  end

end