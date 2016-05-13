json.array!(@activity_pictures) do |activity_picture|
  json.extract! activity_picture, :id, :activity_id, :picture
  json.url activity_picture_url(activity_picture, format: :json)
end
