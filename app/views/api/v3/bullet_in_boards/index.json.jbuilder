# if params[:genre_id] == 0 && params[:update_at] == 0 then
  json.array! @iizukanotices, partial: 'api/v3/bullet_in_boards/iizukanotice', as: :iizukanotice
  json.array! @iizukalectures, partial: 'api/v3/bullet_in_boards/iizukalecture', as: :iizukalecture
  json.array! @iizukacalls, partial: 'api/v3/bullet_in_boards/iizukacall', as: :iizukacall
  json.array! @iizukaintensivelectures, partial: 'api/v3/bullet_in_boards/iizukaintensivelecture', as: :iizukaintensivelecture
  json.array! @iizukastudyingabroads, partial: 'api/v3/bullet_in_boards/iizukastudyingabroad', as: :iizukastudyingabroad
  json.array! @iizukascholarships, partial: 'api/v3/bullet_in_boards/iizukascholarship', as: :iizukascholarship
  json.array! @iizukaothers, partial: 'api/v3/bullet_in_boards/iizukaother', as: :iizukaother
  json.array! @iizukahomepages, partial: 'api/v3/bullet_in_boards/iizukahomepage', as: :iizukahomepage
# end
