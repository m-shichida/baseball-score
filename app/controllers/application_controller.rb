class ApplicationController < ActionController::Base
  helper_method :current_team
  before_action :add_root_url

  private

  def current_team
    @current_team ||= Team.find_by(base: true)
  end

  def add_root_url
    gon.root_url = ENV['ROOT_URL']
  end
end
