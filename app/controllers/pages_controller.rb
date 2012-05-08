class PagesController < ApplicationController
  
  caches_page :archive, :about, :contact 
  
  def archive
    @page_title = "Archive"
    @posts = Post.published.archive
  end
  
  def about
    @page_title = "About me"
  end
  
  def contact
    @page_title = "Contact Me"
  end
  
  def login
    @page_title = "None shall pass"
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
