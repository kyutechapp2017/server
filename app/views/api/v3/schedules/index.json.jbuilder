json.array! @subjects, partial: 'api/v3/schedules/subject', as: :subject
json.array! @weekperiods, partial: 'api/v3/schedules/weekperiod', as: :weekperiod
json.array! @iizukacalls, partial: 'api/v3/schedules/intermediate', as: :intermediate
