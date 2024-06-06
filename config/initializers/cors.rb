Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' #currently all origin can send request
      resource '*', #currently all resources are available
               headers: :any,
               methods: %i[get post put patch delete options head],
               expose: [:Authorization]
    end
  end