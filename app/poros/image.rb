class Image
  attr_reader :image_url,
              :description,
              :author,
              :id,
              :source,
              :author_profile


  def initialize(data)
    @id = nil
    @image_url = data[:urls][:raw]
    @description = data[:description]
    @author = data[:user][:name]
    @source = 'Unsplash'
    @author_profile = data[:user][:links][:html]
  end
end
