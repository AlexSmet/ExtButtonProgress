Pod::Spec.new do |s|
  s.name             = 'ExtButtonProgress'
  s.version          = '0.1.1'
  s.summary          = 'This extension adds a progress indicator to circular UIButton'
  s.homepage         = 'https://github.com/AlexSmet/ExtButtonProgress'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Alex Smetannikov" => "alexsmetdev@gmail.com"}
  s.source           = { :git => 'https://github.com/AlexSmet/ExtButtonProgress.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.swift_version = "4.2"
  s.source_files = 'ExtButtonProgress/Classes/**/*'
end
