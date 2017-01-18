class ConversationsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.all
  end

  # TODO: Consider including commented descriptions of your more complex code
  def create

    # TODO: consider extracting this long conditional into a variable for easy reading.
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      # TODO: you have conversation_params defined below, you shouldn't be calling params[:sender_id] directly.
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
