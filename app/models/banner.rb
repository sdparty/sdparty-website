class Banner < ActiveRecord::Base
  default_scope { order(position: :asc) }
  validates_uniqueness_of :position
  mount_uploader :image, ImageUploader
  scope :published, -> { where(published: true) }
  validates_presence_of :button_name, message: '請輸入按鈕文字'
  validates_presence_of :title, message: '請填寫標題'
  validates_presence_of :image, message: '請上傳圖片'
  validates_presence_of :link, message: '請輸入按鈕連結'
  before_save :set_position

  def set_position
    if not self.position
      self.position = Banner.maximum("position").to_i + 1
    end
  end
end
