#
# Be sure to run `pod lib lint DPGodChat.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DPGodChat'
  s.version          = '0.2.5'
  s.summary          = '环信SDK Pod'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/OuyangMumu/DPGodChat'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '804716454@qq.com' => '804716454@qq.com' }
  s.source           = { :git => 'https://github.com/OuyangMumu/DPGodChat.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  # s.source_files = 'DPGodChat/Classes/**/*'

  #表示类库的源文件存放目录（从上面的目录结构大家可以看到我们的framework源文件都是放在Classes文件夹下，
  #这里是可以修改的，如果你想改的话，随便放在哪里都行，只要在podfile文件中指定好路径都行。我这里就和classes同级添加了新的文件夹Library）
  # s.source_files = 'DPGodChat/Classes/**/*'
  # 资源文件 逗号后面不能有空格
  # s.resource_bundles = {
  #     'DPGodChat' => ['DPGodChat/Assets/*.{jpg,pack,png}']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit','Foundation','SystemConfiguration','CoreGraphics','MobileCoreServices','Security'

    # 依赖的Framework
  s.ios.vendored_frameworks = 'DPGodChat/Library/lib/*.framework'

  # 依赖的Library
  # s.ios.vendored_libraries = 'DPGodChat/Library/lib/*.a'
  s.resource = 'DPGodChat/Library/lib/*.bundle'

  #
  s.dependency 'AFNetworking'
  s.dependency 'MJExtension'
  s.dependency 'MJRefresh'
  s.dependency 'Masonry'
  s.dependency 'SDWebImage'
  s.dependency 'HelpDesk'
  s.dependency 'Hyphenate'

  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
end
