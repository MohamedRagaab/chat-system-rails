Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :applications, param: :token, only: [:create, :show, :update] do
        resources :chats, param: :number, only: [:create, :index, :show] do
          resources :messages, param: :number, only: [:create, :index, :show, :update] do
            get 'search', on: :collection
          end
        end
      end
    end
  end
end
