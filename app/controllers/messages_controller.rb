class MessagesController < ApplicationController
  #User must be logged in
  before_action :authenticate_user!
  before_action :find_conversation
  
    def index
      #Grab all messages in conversation by using find_conversation
      @messages = @conversation.messages
  
      #Load more state, for display reasons
      if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
      end
  
      if params[:m]
        @over_ten = false
        @messages = @conversation.messages
      end
  
      @message = @conversation.messages.new
    end
    #Creates new message, if emssage is successfull , save and redirects user to conversation page (inbox)
    def create
      @message = @conversation.messages.new(message_params)
      if @message.save
        redirect_to conversation_messages_path(@conversation)
      end
    end
    #Starts new message
    def new
      @message = @conversation.messages.new
    end
  
  
  
    private
      #Permit body and user id to messages
      def message_params
        params.require(:message).permit(:body, :user_id)
      end
      #Find conversation based on conversation id params
      def find_conversation
        @conversation = Conversation.find(params[:conversation_id])
      end
  end