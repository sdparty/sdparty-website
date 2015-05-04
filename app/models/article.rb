class Article < ActiveRecord::Base
  has_and_belongs_to_many :issues, -> { uniq }
  belongs_to :user
  mount_uploader :image, ImageUploader
  default_scope { includes(:issues).order(published_at: :desc) }
  scope :published, -> { where("published = ? AND published_at <= ?", true, Time.now) }
  scope :scope_activities, -> { where(kind: 'activity') }
  scope :scope_presses, -> { where(kind: 'press') }
  scope :scope_issues, -> { where(kind: 'issue') }
  before_save :update_youtube_values
  validates_presence_of :title, message: '請填寫標題'
  validates_presence_of :kind, message: '請選擇類型'
  validates_presence_of :content, message: '請填寫內容'
  validates_presence_of :image, message: '請上傳圖片'
  validates_presence_of :published_at, message: '請填寫發佈日期'


  def self.get_issues
    results = []
    includes(:issues).to_a.map do |a|
      a.issues.each do |i|
        results << i unless results.include? i
      end
    end
    return results
  end

  def update_youtube_values
    unless self.youtube_url
      self.youtube_id = nil
      return true
    end
    youtube_id = extract_youtube_id(self.youtube_url)
    unless youtube_id
      self.youtube_url = nil
      self.youtube_id = nil
      errors.add(:base, 'youtube網址錯誤')
      return false
    end
    if self.youtube_id == youtube_id
      # means that youtube is the same, no need to update.
      return nil
    end
    self.youtube_id = youtube_id
    self.youtube_url = "https://www.youtube.com/watch?v=" + self.youtube_id
  #   api_url = 'https://www.googleapis.com/youtube/v3/videos?part=snippet&id=' + self.youtube_id + '&key=' + Setting.google_public_key.api_key
  #   response = HTTParty.get(api_url)
  #   result = JSON.parse(response.body)
  #   unless result['items'].any?
  #     self.youtube_url = nil
  #     errors.add(:base, 'youtube網址錯誤')
  #     return false
  #   end
  #   if result['items'][0]['snippet']['thumbnails'].key?('maxres')
  #     self.remote_image_url = result['items'][0]['snippet']['thumbnails']['maxres']['url']
  #   elsif result['items'][0]['snippet']['thumbnails'].key?('standard')
  #     self.remote_image_url = result['items'][0]['snippet']['thumbnails']['standard']['url']
  #   elsif result['items'][0]['snippet']['thumbnails'].key?('high')
  #     self.remote_image_url = result['items'][0]['snippet']['thumbnails']['high']['url']
  #   elsif result['items'][0]['snippet']['thumbnails'].key?('medium')
  #     self.remote_image_url = result['items'][0]['snippet']['thumbnails']['medium']['url']
  #   elsif result['items'][0]['snippet']['thumbnails'].key?('default')
  #     self.remote_image_url = result['items'][0]['snippet']['thumbnails']['default']['url']
  #   else
  #     self.remote_image_url = ''
  #   end

  #   if self.title.blank?
  #     self.title = result['items'][0]['snippet']['title']
  #   end
  #   if self.content.blank?
  #     self.content = result['items'][0]['snippet']['description'].gsub(/[\n]/,"<br />").gsub(/[\r]/,"")
  #   end
  end

  private

  def extract_youtube_id(url)
    youtube_uri = URI.parse(url)
    if youtube_uri.host == 'www.youtube.com'
      params = youtube_uri.query
      if params
        youtube_id = CGI::parse(params)['v'].first
      else
        youtube_id = youtube_uri.path.split('/')[-1]
      end
    elsif youtube_uri.host == 'youtu.be'
      youtube_id = youtube_uri.path[1..-1]
    else
      self.youtube_url = nil
      errors.add(:base, 'youtube網址錯誤')
      return false
    end
  end
end
