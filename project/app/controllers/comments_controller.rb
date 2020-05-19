class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        puts(comment_params)
        puts(current_user)
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.article_id = params[:article_id]
        @comment.commenter = current_user.username
        @comment.save
        @article.commentcount = @article.commentcount + 1
        @article.save
        puts(@comment.user_id)
        # @comment = @article.comments.create(comment_params.merge(user_id: current_user))
        redirect_to article_path(@article)
      end

      def delete
        @article = Article.find(params[:article_id])
        @article.commentcount = @article.commentcount - 1
        @article.save
        @comment.delete
        redirect_to article_path(@article)
      end
     
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body, :user_id)
        end
end
