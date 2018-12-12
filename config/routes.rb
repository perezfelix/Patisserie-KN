# == Route Map
#
#                    Prefix Verb URI Pattern                                                                              Controller#Action
#                      root GET  /                                                                                        static_pages#index
#        rails_service_blob GET  /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET  /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET  /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT  /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root 'static_pages#index'
  get '/template1', to: 'static_pages#template1'
  get '/template2', to: 'static_pages#template2'
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' },
                     path: "client",
                     path_names: { sign_in: 'connexion',
                                   sign_out: 'deconnexion',
                                   sign_up: 'inscription' }


  # Il semblerait que la méthode ci dessous ne fonctionne pas avec des controllers customs ?
  # devise_scope :user do
  #   get 'connexion', to: 'devise/sessions#new', as: :new_user_session
  #   post 'connexion', to: 'devise/sessions#create', as: :user_session
  #  delete 'deconnexion', to: 'devise/sessions#destroy', as: :destroy_user_session
  #
  #   get 'inscription', to: 'devise/registrations#new', as: :new_user_registration
  #   post 'inscription', to: 'devise/registrations#create'
  #   get 'profil', to: 'devise/registrations#edit', as: :edit_user_registration
  #   patch 'profil', to: 'devise/registrations#update', as: :user_registration
  #   put 'profil', to: 'devise/registrations#update'
  #   delete 'users', to: 'devise/registrations#destroy' # default route
  #   get '/users/cancel', to: 'devise/registrations#cancel' # default route
  # end
end
