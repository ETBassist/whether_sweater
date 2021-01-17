class Image
  attr_reader :image_url,
              :description,
              :author

  def initialize(data)
    @image_url = data[:urls][:raw]
    @description = data[:description]
    @author = data[:user][:name]
  end
end
