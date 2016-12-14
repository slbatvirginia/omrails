# app/models/admin_authorization.rb
class AdminAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
	user && user.admin?
  end

end
