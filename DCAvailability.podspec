Pod::Spec.new do |s|
  s.name             = "DCAvailability"
  s.version          = "0.2.0"
  s.summary          = "Get deprecation warnings when API newer than Development Target is used."

  s.homepage         = "https://github.com/evilDave/DCAvailability"
  s.license          = 'MIT'
  s.author           = { "David Clark" => "davidkclark@gmail.com" }
  s.source           = { :git => "https://github.com/evilDave/DCAvailability.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/da5id'

  s.platform     = :ios, '2.0'
  s.requires_arc = false

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'
end
