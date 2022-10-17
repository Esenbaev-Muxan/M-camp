class CommentsController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_message
  
    def edit
      
    end
    

    def create
      @message = Message.find(params[:message_id])

      @comment = @message.comments.create(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to message_path(@message), notice: 'Comment has been created'
      else
        redirect_to message_path(@message), alert: 'Comment has not been created'
      end
    end
  
    def destroy
      @message = Message.find(params[:message_id])

      @comment = @message.comments.find(params[:id])
      @comment.destroy
      redirect_to message_path(@message)
    end
    def update
      respond_to do |format|
        if @message.update(message_params)
         redirect_to root_path
        else
          "ssss"
        end
      end
    end
  
    private
  
    def set_message
      @message = Message.find(params[:message_id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end