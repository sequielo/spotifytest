ActionController::Routing::Routes.draw do |map|
  map.index "/", :controller => 'application', :action => 'main'
  
  map.resources :spotify_tracks

  map.resources :spotify_artists

  map.resources :djs

  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
