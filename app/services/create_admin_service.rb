##
# This service class basically 
# creates an admin record to have a default user
# from the seeds file
#
#
class CreateAdminService
  def self.call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
      user.first_name = 'JoseLuis'
      user.last_name = 'Torres'
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
      user.confirm
    end
  end
end
