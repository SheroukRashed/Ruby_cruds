Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :articles do
    resources :comments
  end

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  root 'welcome#index'
end