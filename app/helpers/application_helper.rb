module ApplicationHelper
  
  def published_time_tag(post)
    
    if post.published?
      content_tag :time, post.published_at.to_s(:published), :datetime => post.published_at.to_s(:time_tag)
    else
      if post.published_at
        content_tag :time, post.published_at.to_s(:published), :datetime => post.published_at.to_s(:time_tag), :style => "color:red;font-weight:700"       
      else
        content_tag :time, "unpublished", :style => "color:red;font-weight:700"    
      end
    end
    
  end
  
  def albino(text)
    text.gsub(/\<pre( lang="(.+?)")?\>(.+?)\<\/pre\>/m) do
      Albino.colorize($3, $2)
    end
  end
  
  def page_title
    if @post
      content_tag :title, "#{@post.title} | Codebiff"
    elsif @page_title
      content_tag :title, "#{@page_title} | Codebiff"
    else
      content_tag :title, "Codebiff"
    end
  end
  
end

