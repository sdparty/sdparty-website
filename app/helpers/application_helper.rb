module ApplicationHelper
  def default_meta_tags
    {
      separator: "&mdash;".html_safe,
      site: '國會調查兵團 CIC',
      reverse: true,
      description: ' ',
      og: {
        title: '國會調查兵團 CIC',
        description: ' ',
        type: 'website',
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/FB-img-default.gif",
        site_name: '國會調查兵團' }
    }
  end
end
