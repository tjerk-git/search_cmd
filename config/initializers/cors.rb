Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://playcmd.s3.eu-west-1.amazonaws.com/'
      resource '*', headers: :any, methods: [:post, :put]
    end
  end