CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => "AWS",       # required
    :aws_access_key_id      => "",# required
    :aws_secret_access_key  => "",# required
    :path_style => true
  }
  config.fog_directory  = "" # required
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
