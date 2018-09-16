use_frameworks!

def install_shared_pod
  pod 'AlamofireImage', '~> 3.3'
  pod 'SwiftyJSON', '~> 4.1'
end

target 'WWDC' do
  platform :ios, '11.0'

  install_shared_pod

  target 'WWDCTests' do
    inherit! :search_paths
  end

end

target 'WWDC_tvOS' do
  platform :tvos, '11.0'

  install_shared_pod

  target 'WWDC_tvOSTests' do
    inherit! :search_paths
  end

end
