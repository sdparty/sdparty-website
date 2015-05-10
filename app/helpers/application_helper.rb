module ApplicationHelper
  def default_meta_tags
    {
      separator: "｜",
      site: '社會民主黨',
      reverse: true,
      description: '想知道社會民主黨有哪些候選人？想了解社會民主黨的政見？想加入社會民主黨貢獻一份心力？歡迎你跟我們一起捲起袖子，打造台灣的新政治！',
      keywords: "社會民主黨,社民黨,sdparty",
      og: {
        title: '社會民主黨',
        description: '想知道社會民主黨有哪些候選人？想了解社會民主黨的政見？想加入社會民主黨貢獻一份心力？歡迎你跟我們一起捲起袖子，打造台灣的新政治！',
        type: 'website',
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/logo.png",
        site_name: '社會民主黨' }
    }
  end

  def admin_meta_tags
    {
      separator: "：",
      site: '社民黨管理後台',
      og: {
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/logo.png"
      }
    }
  end

  def display_shorter(str, length, additional = "...")
    length = length * 2
    text = Nokogiri::HTML(str).text
    if text.display_width >= length
      additional_text = Nokogiri::HTML(additional).text
      new_length = length - additional_text.display_width
      short_string = text[0..new_length]
      while short_string.display_width > new_length
        short_string = short_string[0..-2]
      end
      short_string + additional
    else
      text
    end
  end

  def get_img_from_content(content)
    doc = Nokogiri::HTML(content)
    img_url = nil
    img = doc.xpath("//img[@src][1]")
    if img.any?
      img_url = img.first.attr('src')
    end
    img_url = "default-img.jpg" if img_url.blank?
    return img_url
  end
end
