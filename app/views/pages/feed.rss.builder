xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Codebiff"
    xml.description "Codeing like a biff!"
    xml.link "/"

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description strip_tags(post.intro)
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link "http://#{request.host}/#{post.slug}"
        xml.guid "http://#{request.host}/#{post.slug}"
      end
    end
  end
end