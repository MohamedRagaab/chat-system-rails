Rails.application.routes.draw do
  # Application routes
  resources :applications, param: :token, only: [:create, :show] do
    # Chat routes within an application
    resources :chats, param: :id, only: [:create, :index] do
      # Message routes within a chat
      resources :messages, param: :id, only: [:create, :index] do
        # Search messages within a chat
        collection do
          get 'search'
        end
      end
    end
  end
end
