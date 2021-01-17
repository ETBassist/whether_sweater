class ImageSerializer
  include FastJsonapi::ObjectSerializer

  attributes :image_url, :description, :author
end
