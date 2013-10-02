require "helpers/opera_helpers"
require "helpers/link_helpers"
helpers OperaHelpers
helpers LinkHelpers


###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end


###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
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

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

composers.each do |composer|
  operas(composer).each do |opera|
    arias(opera).each do |aria|
      proxy build_path(composer, opera, aria), "/aria.html", :locals => { :composer => composer, :opera => opera, :aria => aria }, :ignore => true
    end   
    proxy build_path(composer, opera), "/opera.html", :locals => { :composer => composer, :opera => opera }, :ignore => true
  end
  proxy build_path(composer), "/composer.html", :locals => { :composer => composer }, :ignore => true
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  #activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
  
  activate :directory_indexes
end
