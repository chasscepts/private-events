class EventInvitationsController < ApplicationController
    def new
      @invite = EventInvitations.new
    end

    def create
      host_id = session[:current_user_id]
      attendee_id = params[:attendee_id]
      event_id = params[:event_id]
      @user = User.find(host_id)
      #@invitation = @user.event_invitations.build(event_attendee_id: attendee_id, attended_event_id: event_id)
      @invitation = EventInvitation.new(event_attendee_id: attendee_id, attended_event_id: event_id)
      #render json: @invitation
     
      if @invitation.save
        redirect_to user_path(@user), notice: "Invitation succesfully has been sent"
      else
        redirect_to user_path(@user), notice: "Something wrong happened"
      
      end
    end

end