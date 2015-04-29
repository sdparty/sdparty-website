module ApplicationHelper
  def default_meta_tags
    {
      separator: "｜",
      site: '社會民主黨',
      reverse: true,
      description: ' ',
      og: {
        title: '社會民主黨',
        description: ' ',
        type: 'website',
        image: "#{Setting.url.protocol}://#{Setting.url.host}/images/logo.png",
        site_name: '社會民主黨' }
    }
  end
end
