CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',               
    :aws_access_key_id      => 'access key',
    :aws_secret_access_key  => 'secret key'
  }
  if Rails.env.development?
    config.fog_directory = 'stuff_finder_samuel_shih_dev'
  else
    config.fog_directory = 'stuff_finder_samuel_shih'
  end
end
