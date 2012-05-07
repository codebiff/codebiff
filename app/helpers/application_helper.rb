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
  
end

