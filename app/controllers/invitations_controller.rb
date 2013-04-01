class InvitationsController < ApplicationController

  def index
    @invitations = Invitation.where(:owner_id => current_user.id)
  end

  def new
    @invitation = Invitation.new
  end

  def create
    return render :text => "params => #{params.to_json}"
  end

end
