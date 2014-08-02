Unilo::Application.routes.draw do
  devise_for :users

  resources :questions do
    get :next, on: :member
    get :last, on: :member
    get :complete, on: :collection
  end

  resources :jacs_codes do
    get :autocomplete_jacs_name, :on => :collection
  end

  root 'questions#index'
  
  get 'elos' => 'elos#index', as: :elos
  get 'elos/:id1/:id2' => 'elos#show', as: :elo
  get 'elos/:preferred_university_id/:other_university_id/complete' => 'elos#complete', as: :select_elo
  get 'elos/end' => 'elos#end', as: :end_elos
end
