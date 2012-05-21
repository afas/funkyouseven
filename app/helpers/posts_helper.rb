#encoding: utf-8
module PostsHelper

  def journal_date(date)
    date = Date.strptime(date, "%Y%m")
    Russian::strftime(date, "%B %Y г.")
  end

end
