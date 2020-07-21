class ApplicationController < ActionController::Base
  helper_method :current_team

  private

  def current_team
    @current_team ||= Team.find_by(base: true)
  end
end
