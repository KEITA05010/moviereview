class User::CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
         redirect_to request.referer
        else
         redirect_to request.referer
        end
    end
    
    private
    # ストロングパラメータ
    def comment_params
        params.require(:comment).permit(:movie_id,:content,:user_id )
    end
    
end
