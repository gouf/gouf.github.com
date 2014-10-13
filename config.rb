###
# Gem
###
require 'slim'

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :slim, pretty: true, sort_attrs: true, format: :html5

# Blog
activate :blog do |blog|
  blog.prefix = 'blog'
  # blog.permalink = ":year/:month/:day/:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = 'layout'
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 140
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  blog.default_extension = '.markdown'

  # blog.tag_template = 'tag.html'
  # blog.calendar_template = 'calendar.html'

  blog.paginate = true
  # blog.per_page = 10
  blog.per_page = 12
  # blog.page_link = "page/:num"
  # blog.permalink = '{year}/{month}/{day}/{title}.html'
  blog.permalink = '{year}/{month}/{title}.html'
  blog.page_link = 'p{num}'
end

# Build-specific configuration
Time.zone = 'Tokyo'
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Markdown settings
markdown_options = {
  tables: true,
  autolink: true,
  gh_blockcode: true,
  fenced_code_blocks: true,
  with_toc_data: true
}
set :markdown, markdown_options
set :markdown_engine, :redcarpet
activate :syntax, line_numbers: true

# minify html
activate :minify_html do |html|
  html.remove_multi_spaces        = true   # Remove multiple spaces
  html.remove_comments            = true   # Remove comments
  html.remove_intertag_spaces     = false  # Remove inter-tag spaces
  html.remove_quotes              = true   # Remove quotes
  html.simple_doctype             = false  # Use simple doctype
  html.remove_script_attributes   = true   # Remove script attributes
  html.remove_style_attributes    = true   # Remove style attributes
  html.remove_link_attributes     = true   # Remove link attributes
  html.remove_form_attributes     = false  # Remove form attributes
  html.remove_input_attributes    = true   # Remove input attributes
  html.remove_javascript_protocol = true   # Remove JS protocol
  html.remove_http_protocol       = true   # Remove HTTP protocol
  html.remove_https_protocol      = false  # Remove HTTPS protocol
  html.preserve_line_breaks       = false  # Preserve line breaks
  html.simple_boolean_attributes  = true   # Use simple boolean attributes
end
