Regevents::Application.routes.draw do
root to: 'events#index'
get '/events' => 'events#index'
get '/events/:id' => 'events#show', as: 'event'
end
