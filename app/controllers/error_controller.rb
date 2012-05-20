class ErrorController < ApplicationController
  def access_denied
  end

  def not_found
    render :action => 'not_found', :status => 404

    #if request.fullpath !~ /^\/\w{2}\/.+/
    #  redirect_to "/#{I18n.locale}#{request.fullpath}"
    #else
    #end
  end

end
