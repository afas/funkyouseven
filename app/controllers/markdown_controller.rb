class MarkdownController < ApplicationController
  def preview
    @content = params[:data]

    render :layout => false
  end
end
