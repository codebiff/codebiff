class PagesController < ApplicationController
  
  caches_page :archive, :about, :contact 
  
  def archive
    @posts = Post.published.archive
  end
  
  def about
  end
  
  def contact
  end
  
  def login
  end
  
  def feed
    @posts = Post.published.limit(10)
    respond_to do |format|
      format.rss { render :layout => false}
    end
  end
  
  def signin
    session[:admin] = true if params[:password] == ENV['ADMIN_PASSWD']
    redirect_to root_url
  end
  
  def logout
    session[:admin] = nil
    redirect_to root_url
  end

end
