class Product < ApplicationRecord

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  mount_uploader :image, ImageUploader
end
