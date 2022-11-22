class ApplicationController < ActionController::Base


 def after_sign_in_path_for(resource)
    #  byebug
     
#  if resource.is_a?(User)
#  if resource.class.to_s == "User"
 if user_signed_in?
     root_path
 elsif admin_signed_in?
     admin_path
 end
     
#   case resource.class.to_s
#   when "Admin"
#      admin_path
#   when "User"
#      root_path
#   else
#      root_path
#   end
 end






def after_sign_out_path_for(resource)
case resource
when :admin   # ログアウト時はシンボルが返ってくる
  new_admin_session_path
when :user  # ログアウト時はシンボルが返ってくる
  root_path
end
end
end
