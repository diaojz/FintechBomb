# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://cdn.cocoapods.org/'

workspace './FintechBomb.xcworkspace'
project './FintechBomb/FintechBomb.xcodeproj'

platform :ios, '13.0'
use_frameworks!

# ignore all warnings from all dependencies
inhibit_all_warnings!


def dev_pods
  pod 'SwiftLint', '= 0.42.0', configurations: ['Debug']
  pod 'SwiftGen', '= 6.4.0', configurations: ['Debug']
end

def core_pods
  pod 'RxSwift', '= 5.1.1'
  pod 'RxRelay', '= 5.1.1'
  pod 'Alamofire', '= 5.3.0'
end

def thirdparty_pods
#  pod 'Firebase/Analytics', '= 7.0.0'
#  pod 'Firebase/Crashlytics', '= 7.0.0'
#  pod 'Firebase/RemoteConfig', '= 7.0.0'
#  pod 'Firebase/Performance', '= 7.0.0'
end

def ui_pods
  pod 'SnapKit', '= 5.0.1'
  pod 'Kingfisher', '= 5.15.6'
  pod 'RxCocoa', '= 5.1.1'
  pod 'RxDataSources', '= 4.0.1'
end

def internal_pods
  pod 'DesignKit', :path => './Frameworks/DesignKit', :inhibit_warnings => false
#  pod 'DDKit', :path => './Frameworks/DDKit', :inhibit_warnings => false
end

def test_pods
  pod 'Quick', '= 3.0.0'
  pod 'Nimble', '= 9.0.0'
  pod 'RxTest', '= 5.1.1'
  pod 'RxBlocking', '= 5.1.1'
end

target 'FintechBomb' do
  # Comment the next line if you don't want to use dynamic frameworks
#  use_frameworks!

  # Pods for FintechBomb
  dev_pods
  core_pods
  thirdparty_pods
  ui_pods
  internal_pods


  target 'FintechBombTests' do
    inherit! :search_paths
    # Pods for testing
    core_pods
    thirdparty_pods
    test_pods
  end

  target 'FintechBombUITests' do
    # Pods for testing
  end

end
