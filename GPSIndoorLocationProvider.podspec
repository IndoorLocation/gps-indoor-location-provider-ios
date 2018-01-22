Pod::Spec.new do |s|
  s.name         = "GPSIndoorLocationProvider"
  s.version      = "1.0.1"
  s.license      = { :type => 'MIT' }
  s.summary      = "Allows the GPS to be used with IndoorLocation"
  s.homepage     = "https://github.com/IndoorLocation/gps-indoor-location-provider-ios.git"
  s.author       = { "Indoor Location" => "indoorlocation@mapwize.io" }
  s.platform     = :ios
  s.ios.deployment_target = '6.0'
  s.source       = { :git => "https://github.com/IndoorLocation/gps-indoor-location-provider-ios.git", :tag => "#{s.version}" }
  s.source_files  = "ILGPSIndoorLocationProvider/*.{h,m}"
  s.dependency "IndoorLocation", "~> 1.0"
end
