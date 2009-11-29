
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Tarjolla olevat kurssit"
    xml.description "Kaikki kurssit"
    xml.link courses_url

    for course in @courses
      xml.item do
        xml.title course.name
        xml.description course.description
        xml.pubDate course.created_at
        xml.link course_url(course)
      end
    end
  end
end

