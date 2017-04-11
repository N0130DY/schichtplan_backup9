class TaskController < ApplicationController
  before_action :userlogin
  protect_from_forgery

  def update
    mitarbeiter = Mitarbeiter.find(params["id"])
    #status_old = mitarbeiter.status
    mitarbeiter.text = params["text"]
    mitarbeiter.start_date = params["start_date"]
    mitarbeiter.duration = params["duration"]
    mitarbeiter.parent = params["parent"]
    mitarbeiter.status = params["status"]
    mitarbeiter.user = params["user"]
    mitarbeiter.user_id = params["user_id"]
    mitarbeiter.email = params["email"]
    mitarbeiter.save

    #User.find_by_vorname = Mitarbeiter.user

    if @mitarbeiter.update(mitarbeiter_params) #&& mitarbeiter.status < status_old
      # Sendet email
      @mitarbeiter = Mitarbeiter.save(mitarbeiter_params)
      InfoMailer.info_email(@mitarbeiter).deliver
    end

    render :json => {:status => "ok"}
  end

  def add
    mitarbeiter = Mitarbeiter.create :text => params["text"], :start_date=> params["start_date"], :duration => params["duration"],
                       :parent => params["parent"], :status => params["status"], :user => params["user"], :user_id => params["user_id"], :email => params["email"]

    render :json => {:tid => task.id}
  end

  def delete
    Mitarbeiter.find(params["id"]).destroy
    render :json => {:status => "ok"}
  end

  #def mitarbeiter_params
  #  params.require(:mitarbeiter).permit(:text, :start_date, :duration, :parent, :status, :user, :user_id, :email)
  #end
end
