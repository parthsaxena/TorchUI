# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TorchUI' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TorchUI
  pod 'GoogleMaps', '~> 7.3'
  pod 'Google-Maps-iOS-Utils', '~> 4.2.2'
  pod 'Starscream'
  pod 'MapboxMaps', '10.16.0'
  pod 'SwiftUI-Shimmer', :git => 
'https://github.com/markiv/SwiftUI-Shimmer.git'

  target 'TorchUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TorchUIUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
                xcconfig_path = config.base_configuration_reference.real_path
                xcconfig = File.read(xcconfig_path)
                xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
                File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }

            end
        end
    end
end
