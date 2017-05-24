class MessagesController < ApplicationController

  def index
    @request = Request.find(params[:request_id])
    @messages = @request.messages
    @message = Message.new
    @job = Job.find(params[:job_id])
    @destinator = destinator
  end

  def create
    @job = Job.find(params[:job_id])
    @request = Request.find(params[:request_id])
    @message = Message.new(message_params)
    @message.creator = current_user
    @message.job = @job
    @message.request = @request
    @message.destinator = destinator

    if @message.save
      redirect_to job_request_messages_path(@job, @request)
    else
      render :new
    end
  end

  def conversations
    @user = current_user
    @requests = @user.requests
    @conversations = []
    @requests.each do |request|
      unless request.messages.empty?
        @conversations << request.messages.last
      end
    end

    p @conversations
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def destinator
    if @creator == @job.user
      @request.creator
    else
      @request.destinator
    end
  end
end
