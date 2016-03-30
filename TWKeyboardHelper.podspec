@version = "0.0.2"
Pod::Spec.new do |s|
  s.name         = 'TWKeyboardHelper'
  s.version      = @version
  s.summary      = 'check or radio group'
  s.homepage     = 'https://github.com/taewan0530/TWKeyboardHelper'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'taewan' => 'taewan0530@daum.net' }
  s.source       = { :git => "https://github.com/taewan0530/TWKeyboardHelper.git", :tag => @version }
  s.source_files = 'Pod/**/*.{swift}'
  
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  
end