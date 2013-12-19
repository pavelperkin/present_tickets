class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
    @not_me = User.all.select {|u| u.id != current_user.id}.first
    @tickets_my = current_user.tickets
    @tickets_not_my = @not_me.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to root_path
    else
        format.html { render action: 'new' }
    end
  end

  def update
    @ticket.update(ticket_params)
    redirect_to root_path
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:user_id, :header, :description)
    end
end
