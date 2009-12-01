
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "LoL-Ilmo 2.0:n Newsfeed"
    xml.description "Mitä tapahtuu?"
    xml.link courses_url

    for feed in @newsfeed
      xml.item do
        xml.title feed.message
        #xml.description course.description
        xml.pubDate feed.created_at
        #xml.link course_url(course)
      end
    end
  end
end

