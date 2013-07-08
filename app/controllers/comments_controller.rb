class CommentsController < ApplicationController
  
  
  def create_comment
     @article=Article.find(params[:id ])
      @article.comment_no= @article.comment_no+1
       @comment= @article.comments.new(params[:comments])
    if (@comment.save && @article.save)
      redirect_to(:controller=> 'articles',:action => 'read_more',:id => @article.id)
    else
      render('main')
    end
  end
  
  def comment
    
  end
  
  def delete_comment
     @comment = Comment.find(params[:id])
  end
  
 def destroy_comment
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    redirect_to(:controller => 'users',:action => 'main')
  end
  
  def like_comment_no
      @comment=Comment.find(params[:id ])
     @comment.like_comment_no= @comment.like_comment_no+1
      if @comment.update_attributes(params[:article])
       redirect_to(:controller=> 'articles',:action =>'read_more',:id=> @article.id)
     end
  end
  
end
