class KalendarController < ApplicationController
  before_action :userlogin
  def index
  end

  def data
    mitarbeiters = Mitarbeiter.all

    render :json=>{
        :data => mitarbeiters.map{|mitarbeiter|{
            :id => mitarbeiter.id,
            :text => mitarbeiter.text,
            :start_date => mitarbeiter.start_date.to_formatted_s(:db),
            :duration => mitarbeiter.duration,
            :parent => mitarbeiter.parent,
            :status => mitarbeiter.status,
            :user => mitarbeiter.user,
            :user_id => mitarbeiter.user_id
        }}
    }
  end
end

