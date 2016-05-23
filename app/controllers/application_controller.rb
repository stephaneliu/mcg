class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def store_location
    session[:previous_url] = request.fullpath unless interacting_with_authentication
  end

  def after_sign_in_path_for(_resource)
    session[:previous_url] || dashboard_url
  end

  def after_sign_out_path_for(_resource)
    root_url
  end

  def interacting_with_authentication
    authentication_pattern = %r{/\/users/}
    request.fullpath =~ authentication_pattern
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:warning] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    redirect_to(request.referrer || root_path)
  end
end
