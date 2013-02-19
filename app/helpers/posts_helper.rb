#encoding: utf-8
module PostsHelper

  def magazine_date(date)
    Russian::strftime(date, "%B %Y г.")
  end

  def format_html_data(data, links = false)
    output = ""
    partials = data.split(";")

    partials.each do |partial|
      title = partial.split("{")[0]
      if links
        href = partial.split("{")[1].gsub("}", "")
        output += raw "<sup onClick='goUrl(\"#{href}\")'>#{title}</sup> "
      else
        output += title
      end
    end
    output
  end

  def format_title(title, href = false)
    output = ""
    if href
      output += raw "<sup onClick='goUrl(\"#{href}\")'>#{title}</sup> "
    else
      output += title
    end
    output
  end
end
