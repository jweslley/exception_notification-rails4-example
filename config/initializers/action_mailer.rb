ActionMailer::Base.delivery_method        = :smtp
ActionMailer::Base.perform_deliveries     = true
ActionMailer::Base.raise_delivery_errors  = true
ActionMailer::Base.smtp_settings = { :address => "localhost", :port => 1025 }
