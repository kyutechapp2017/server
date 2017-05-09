json.array! @subjects, partial: 'api/v3/schedules/subject', as: :subject
json.array! @weekperiods, partial: 'api/v3/schedules/weekperiod', as: :iizukalecture
json.array! @iizukacalls, partial: 'api/v3/schedules/weekperiod', as: :iizukacall
