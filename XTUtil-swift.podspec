Pod::Spec.new do |s|
  s.name             = 'XTUtil-swift'
  s.version          = '0.0.1'
  s.summary          = 'A short description of XTUtil-swift.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/akateason/XTUtil-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'teason' => 'akateason@qq.com' }
  s.source           = { :git => 'https://github.com/akateason/XTUtil-swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'XTUtil-swift/Classes/**/*'

  # s.resource_bundles = {
  #   'XTUtil-swift' => ['XTUtil-swift/Assets/*.png']
  # }

  #s.subspec 'XTUtil-swift' do | sm |
      #sm.source_files = 'XTUtil-swift/ZYSubModule/**/*'
      #sm.dependency 'AFNetworking', '~> 2.3'
  #end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
