class PagesController < ApplicationController
  def index
    raise StandardError, "ERROR: #{params[:error]}" if params[:error].present?
  end

  def background_notification
    begin
      1/0
    rescue Exception => e
      ExceptionNotifier.notify_exception(e, :data => {:msg => "Cannot divide by zero!"})
    end
    redirect_to root_url, alert: 'A background_notification was sent. Check mailcatcher!!!'
  end
end
