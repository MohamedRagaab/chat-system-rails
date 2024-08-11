class ApplicationService
  def self.create_application(params)
    params[:token] = SecureRandom.hex(16)
    Application.create!(params)
  end

  def self.show_application(token)
    Application.find_by!(token: token)
  end

  def self.update_application(token, params)
    application = Application.find_by!(token: token)
    application.update!(params)
    application
  end
end
