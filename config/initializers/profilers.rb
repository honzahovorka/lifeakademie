Rails.application.config.middleware.delete 'Rack::Deflater'
Rails.application.config.middleware.insert_before 'Rack::MiniProfiler', 'Rack::Deflater'
