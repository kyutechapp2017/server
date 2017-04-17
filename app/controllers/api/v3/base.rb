module API
  module V3
    class Base < Grape::API
      version 'v3'
      format :json
    end
    mount API::V3::Schedules
  end
end
