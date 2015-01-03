class API < Grape::API
  prefix 'api'
  mount V1::API
  add_swagger_documentation api_version: 'v1',
                            hide_documentation_path: true
end
