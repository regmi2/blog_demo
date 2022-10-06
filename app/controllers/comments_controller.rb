class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    def create 
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            flash[:notice] = "Comment has been created"
            redirect_to post_path(@post)
        else 
            flash[:alert] = "comment not created"
            redirect_to post_path(@post)
        end
    end

    def destroy 
        @comment = @post.comments.find(parms[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end


    def set_post

    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

    
end
