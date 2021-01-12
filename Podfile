# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'https://github.com/CocoaPods/Specs.git'

target 'kinda' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'SnapKit'
  # Pods for kinda
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Database'
  pod 'Firebase/Storage'
  pod 'Firebase/Analytics'
  pod 'Firebase/Firestore'

  target 'kindaTests' do
      pod 'Firebase/Core'
    pod 'Firebase/Auth'
    pod 'Firebase/Database'
    pod 'Firebase/Storage'
    pod 'Firebase/Analytics'
  pod 'Firebase/Firestore'
    inherit! :search_paths
    # Pods for testing
  end

  target 'kindaUITests' do
    pod 'Firebase/Core'
    pod 'Firebase/Auth'
    pod 'Firebase/Database'
    pod 'Firebase/Storage'
    pod 'Firebase/Analytics'
    pod 'Firebase/Firestore'
      inherit! :search_paths
    # Pods for testing
  end

end

# add pods for any other desired Firebase products
# https://firebase.google.com/docs/ios/setup#available-pods