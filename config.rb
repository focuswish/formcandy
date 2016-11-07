###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
  set :debug_assets, true
end

###
# Helpers
###
set :url_root, 'http://www.formcandy.com'
set :brand, 'formcandy'
set :email, 'formcandy.binarygourmet@mailhero.io'

set :nav_link_1, "http://www.formcandy.com"
set :nav_link_2, "/about"
set :nav_link_3, "/contact"
set :nav_1, 'Home'
set :nav_2, "About"
set :nav_3, "Contact"

set :footer_desc, ''

set :facebook, "formcandy"
set :twitter, "formcandy"

# Mailchimp Settings
set :mailchimp_url, '//formcandy.us14.list-manage.com/subscribe/post?u=7b41637e9bf3e67ff515643cb&amp;id=b999ca9e82'

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "{title}.html"
  # Matcher for blog source files
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".markdown"
  blog.new_article_template = "index.html"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end


activate :search_engine_sitemap

activate :directory_indexes

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css
  # Minify HTML on build
  activate :minify_html
  # Minify Javascript on build
  activate :minify_javascript
end

# config.rb
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-70066543-1' # Replace with your property ID.
  # Removing the last octet of the IP address (default = false)

  ga.anonymize_ip = false

  # Tracking across a domain and its subdomains (default = nil)
  ga.domain_name = 'http://www.formcandy.com'

  # Tracking across multiple domains and subdomains (default = false)
  ga.allow_linker = false

  # Enhanced Link Attribution (default = false)
  ga.enhanced_link_attribution = false

  # Tracking Code Debugger (default = false)
  ga.debug = false

  # Tracking in development environment (default = true)
  ga.development = true

  # Compress the JavaScript code (default = false)
  ga.minify = false

  # Output style - :html includes <script> tag (default = :html)
  ga.output = :html
end

activate :deploy do |deploy|
deploy.deploy_method = :rsync
deploy.host          = 'root@104.236.122.67'
deploy.path          = '/srv/www/formcandy.com/build'
  # Optional Settings
deploy.user  = 'root'
  # deploy.port  = 5309 # ssh port, default: 22
  # deploy.clean = true # remove orphaned files on remote host, default: false
deploy.flags = '-avz --delete' # add custom flags, default: -avz
end