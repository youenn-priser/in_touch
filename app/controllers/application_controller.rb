class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  protected

  def after_sign_in_path_for(resource)
    # 'http://localhost:3000/projects'
    projects_path
  end

  def after_sign_out_path_for(resource)
    # 'http://localhost:3000/'
    root_path
  end

end
