class UsersController < ApplicationController

  load_and_authorize_resource :except => [ :home, :main,:about, :contact,:main,:edit,
                                    :like_no,:update,:create_comment,:like_comment,:feedback,:read_more,:show]
  
  before_filter :authenticate_user! ,:except => [:home ,:about, :contact,:main,:edit,:feedback,:read_more,:show]
  
  def increment(attribute, by=1)
    #self[attribute] ||=0
    self[attribute]+=by
    self
  end

   def like_no
      @article=Article.find(params[:id ])
     increment(@article.like_no)
      if @article.update_attributes(params[:article])
       redirect_to(:action =>'main')
     end
  end
  
  def home
    
  end
  
  def main
   @articles=Article.all
  end
  
  def create_article
      @articles = Article.new(params[:article])
    if @articles.save
      redirect_to(:action => 'main')
    else
      render('add')
    end
  end
  
  def create_comment
     @article=Article.find(params[:id ])
     @comment= @article.comments.new(params[:comments])
    if @comment.save
      redirect_to(:action => 'main')#, :id => @article.id)
    else
      render('main')
    end
  end
  
  def comment
    
  end
  
  def comment_no
     @article = Article.find(params[:id ])
  end
  
  def edit_article
    @article=Article.find(params[:id ])
  end
  
  def update_article
     @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice]= "Updated Sucessfully!"
      redirect_to(:action => 'main' )
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
    redirect_to(:action => 'main')
  end
  
  def destroy_comment
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(:action => 'main')#,:id=> @article.id)
  end
  
  def read_more
     @article=Article.find(params[:id ])
     @comment = @article.comments.new
     @comment = @article.comments.all
  end
  
  def add_article
    @article = Article.new
  end
  
  def show
    @user=User.find(params[:id ])
  end
  
  def edit
    @user=User.find(params[:id ])
  end
  
  def update
     @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice]= "Updated Sucessfully!"
      redirect_to(:action => 'show' ,:id => @user.id)
    else
      flash[:notice]= "Something Went Wrong"
      render('edit')
    end
  end
  
  

end
