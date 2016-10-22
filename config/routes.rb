Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :books do
    collection do
    end
  end

  namespace :interface do
    resources :books do
      collection do
        get :all
      end
    end
  end
end
