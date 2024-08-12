module ResponseFormatting
  extend ActiveSupport::Concern

  included do
    def render_success(message:, data:)
      data = data.as_json
      data.delete("id")
      data.delete("chat_id")
      data.delete("application_id")

      render json: {
        message: message,
        status: true,
        data: data
      }, status: :ok
    end

    def render_error(message:)
      render json: {
        error: message,
        status: false
      }, status: :unprocessable_entity
    end
  end
end
