Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teas
      resources :subscriptions
      resources :customers do
        resources :subscriptions, controller: :customer_subscriptions
      end
    end
  end

  # namespace :api do
  #   namespace :v1 do
  #     resources :customers do
  #       resources :subscriptions, controller: :customer_subscriptions
  #     end
  #   end
  # end
  #
  # namespace :api do
  #   namespace :v1 do
  #     resources :subscriptions
  #   end
  # end
end
