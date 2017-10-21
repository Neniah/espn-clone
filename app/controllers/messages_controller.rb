class MessagesController < ApplicationController

  before_action :find_message, only: [:show, :edit, :update, :delete]

  def index
    @messages = Message.all.order('created_at DESC')
  end

  def new
    @message = Message.new
  end

  def show
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def message_params
      params.require(:message).permit(:title, :description)
    end

    def find_message
      @message = Message.find(params[:id])
    end
end
