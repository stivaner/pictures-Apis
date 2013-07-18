if Rails.env.test? or Rails.env.cucumber? or Rails.env.spec?
  CarrierWave.configure do |config|
    config.permissions = 0600
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.permissions = 0666
    config.directory_permissions = 0777
    config.storage = :fog
  end
end