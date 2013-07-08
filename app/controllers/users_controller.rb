class UsersController < ApplicationController

  load_and_authorize_resource :except => [ :home, :main,:about, :contact,:gallery,:update,:feedback]
  
  before_filter :authenticate_user! ,:except => [:home ,:about,:main, :contact,:gallery,:feedback,:update]
  
  def home
    
  end
  
  #def sign_out
   # destroy_user_session_path (:method=>'delete')
  #end
  
  def main
   @articles=Article.all
  end
  
  def feedback
    
  end
  
  def list
    @user=User.all
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
      #flash[:notice]= "Updated Sucessfully!"
      redirect_to(:controller => 'users',:action => 'main')
    else
      flash[:notice]= "Something Went Wrong"
      render('edit')
    end
  end
  
  def delete
     @user=User.find(params[:id ])
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to(:controller=> 'users',:action => 'list')
  end
  
  
end
