#encoding: utf-8
module PostsHelper

  def magazine_date(date)
    Russian::strftime(date, "%B %Y г.")
  end

end
