Rails.application.routes.draw do
  root to: 'league#home'
  get 'league/club_stat'
  get 'league/champ_stat'
  get 'league/club_info'
  get 'league/matches'
  get 'league/countries'
  get 'league/cham_info'

  get 'league/find_by_champ'  

  get 'league/find_club_stat'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
