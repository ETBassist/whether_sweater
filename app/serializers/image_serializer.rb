class ImageSerializer
  include FastJsonapi::ObjectSerializer

  attributes :image_url, :description, :author, :source, :author_profile
end
