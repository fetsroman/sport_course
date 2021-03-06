# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( admin.js admin/courses_form.scss)

%w( welcome courses lessons rates custom_page devise/sessions devise/registrations devise/confirmations bought_list payment admin admin/courses admin/statistics admin/lessons admin/rates admin/sessions users/sessions users/registrations).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js.coffee", "#{controller}.js", "#{controller}.scss", "devise/#{controller}.scss", "admin/#{controller}.scss"]
end
Rails.application.config.assets.precompile += %w( VideoJS.eot VideoJS.svg VideoJS.ttf VideoJS.woff )

Rails.application.config.assets.paths << "#{Rails.root}/app/assets/videos"
