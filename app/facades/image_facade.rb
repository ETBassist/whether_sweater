class ImageFacade
  class << self
    def image_search(location)
      response = UnsplashService.city_image_search(location)
      Image.new(response[:results][0])
    end
  end
end
