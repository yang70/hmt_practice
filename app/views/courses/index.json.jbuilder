json.array!(@courses) do |course|
  json.extract! course, :id, :name, :room
  json.url course_url(course, format: :json)
end
