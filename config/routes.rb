Regevents::Application.routes.draw do

	root to: 'events#index'
	# get '/events' => 'events#index'
	# get '/events/new' => 'events#new', as: 'new_event'
	# get '/events/:id' => 'events#show', as: 'event'
	# get '/events/:id/edit' => 'events#edit', as: 'edit_event'
	# patch '/events/:id' => 'events#update'

	resources :events do
		resources :registrations
	end
end

