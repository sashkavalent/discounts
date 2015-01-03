# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
# run Rack::Cascade.new([Rails.application, API]) # запрос обрабатывают 2 приложения, в консоль пишет только rails
# run Rack::URLMap.new('/' => Rails.application,
#                      '/api' => API) # запросы на разные роуты обрабатывают соответствующие приложения, но grape не пишет в лог
# run API # работает только grape, логи пишет только о запросах в БД
