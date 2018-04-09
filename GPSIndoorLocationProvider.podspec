Pod::Spec.new do |s|
  s.name         = "GPSIndoorLocationProvider"
  s.version      = "1.0.3"
  s.license      = { :type => 'MIT' }
  s.summary      = "Allows the GPS to be used with IndoorLocation"
  s.homepage     = "https://github.com/IndoorLocation/gps-indoor-location-provider-ios.git"
  s.author       = { "Indoor Location" => "indoorlocation@mapwize.io" }
  s.platform     = :ios
  s.ios.deployment_target = '6.0'
  s.source       = { :git => "https://github.com/IndoorLocation/gps-indoor-location-provider-ios.git", :tag => "#{s.version}" }
  s.source_files  = "gps-indoor-location-ios/Provider/*.{h,m}"
  s.dependency "IndoorLocation", "1.0.4"
end
