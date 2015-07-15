class MessagesController < ApplicationController
  before_action :find_message, only: [:edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to '/messages'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to messages_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

  def find_message
    @message = Message.find(params[:id])
  end

end
