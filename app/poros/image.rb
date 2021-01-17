class Image
  attr_reader :image_url,
              :description,
              :author,
              :id,
              :type


  def initialize(data)
    @id = nil
    @type = 'image'
    @image_url = data[:urls][:raw]
    @description = data[:description]
    @author = data[:user][:name]
  end
end
