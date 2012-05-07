class Post < ActiveRecord::Base
  attr_accessible :body, :intro, :published, :slug, :title, :tag_list, :published_at
      
  default_scope order("published_at DESC")
  scope :published, where(:published => true)
  
  acts_as_taggable
  
  def self.text_search(query)
    if query.present?
      where("title @@ :q or intro @@ :q or body @@ :q", :q => query)
    else
      scoped
    end
  end
  
  def self.archive
    self.all.group_by { |p| p.published_at.beginning_of_month }
  end
  
end
