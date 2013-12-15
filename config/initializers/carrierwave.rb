CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',               
    :aws_access_key_id      => 'AKIAJ2VDZE4L24TLHL4Q',
    :aws_secret_access_key  => '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'
  }
  if Rails.env.development?
    config.fog_directory = 'stuff_finder-dev'
  else
    config.fog_directory = 'stuff_finder'
  end
end
