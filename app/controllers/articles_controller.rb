class ArticlesController < ApplicationController
  
  def add_article
    @article = Article.new
  end
  
  def create_article
      @articles = Article.new(params[:article])
    if @articles.save
      redirect_to(:controller=> 'users',:action => 'main')
    else
      render('add')
    end
  end
  
   def edit_article
    @article=Article.find(params[:id ])
  end
  
  def update_article
     @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice]= "Updated Sucessfully!"
      redirect_to(:controller=> 'users',:action => 'main' )
    else
      flash[:notice]= "Something Went Wrong"
      render('edit_article')
    end
  end
  
  def delete_article
    @article = Article.find(params[:id])
  end
  
  def destroy_article
    article = Article.find(params[:id])
    article.destroy
    redirect_to(:controller=> 'users',:action => 'main')
  end
  
  def read_more
     @article=Article.find(params[:id ])
     @comment = @article.comments.new
     @comment = @article.comments.all
  end
  
  def like_no
      @article=Article.find(params[:id ])
     @article.like_no= @article.like_no+1
      if @article.update_attributes(params[:article])
       redirect_to(:controller=> 'articles',:action =>'read_more',:id=> @article.id)
     end
  end
  
  def comment_no
     @article = Article.find(params[:id ])
  end
  
end
