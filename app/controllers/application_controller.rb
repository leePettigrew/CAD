class ApplicationController < ActionController::Base

  helper_method :resource, :resource_name, :devise_mapping

  private

  def resource
    @resource ||= User.new
  end

  def resource_name
    :user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end



	
end
