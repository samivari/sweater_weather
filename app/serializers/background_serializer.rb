class BackgroundSerializer
  include JSONAPI::Serializer
  set_type 'image'
  set_id :id
  attributes :location, :image_url, :author, :logo, :source
end
