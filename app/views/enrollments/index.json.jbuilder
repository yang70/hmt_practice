json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :grade
  json.url enrollment_url(enrollment, format: :json)
end
