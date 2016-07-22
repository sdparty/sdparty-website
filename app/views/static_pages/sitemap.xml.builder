base_url = "https://#{request.host_with_port}"
xml.instruct! :xml, :version=>'1.0'

xml.tag! 'urlset', "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc "#{base_url}"
    xml.changefreq "daily"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/about"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/join"
    xml.lastmod Time.now.to_date
    xml.changefreq "daily"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/donate_plan"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/donate_one"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/fundraising"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/programs"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/programs/1"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/programs/2"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/programs/3"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/policies"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/policies/1"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/policies/2"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/policies/3"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/policies/4"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/policies/5"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/policies/6"
    xml.lastmod Time.now.to_date
    xml.changefreq "monthly"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/articles/presses"
    xml.lastmod Time.now.to_date
    xml.changefreq "daily"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/articles/activities"
    xml.lastmod Time.now.to_date
    xml.changefreq "daily"
    xml.priority 1.0
  end

  xml.url do
    xml.loc "#{base_url}/articles/issues"
    xml.lastmod Time.now.to_date
    xml.changefreq "daily"
    xml.priority 1.0
  end

  @articles.each do |article|
    xml.url do
      xml.loc article_url(article)
      xml.lastmod article.updated_at.to_date
      xml.changefreq "monthly"
      xml.priority 0.9
    end
  end

end
