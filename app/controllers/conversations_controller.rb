class ConversationsController < ApplicationController
    #User must be logged in
    before_action :authenticate_user!
  
    def index
      #Get all users
      @users = User.all
      #Display all users in conversation page (inbox)
      @conversations = Conversation.all
    end
  
    def create
      #Calls between scope defined in model, and grabs the two users, finds and displays their conversation
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        #If no conversation is present between the two users, create a new conversation
        @conversation = Conversation.create!(conversation_params)
      end
      #Redirects user to conversation page(inbox)
        redirect_to conversation_messages_path(@conversation)
    end
      
    private
    #Called above in creating a new covnersation and permits ids being used
      def conversation_params
        params.permit(:sender_id, :recipient_id)
      end
  end