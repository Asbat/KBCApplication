source 'https://github.com/CocoaPods/Specs.git'
  
platform :ios, '16.0'
inhibit_all_warnings!

workspace 'Tasks'

def app_pods
  
  use_frameworks!
  
end

def shared_pods
  
  use_frameworks!
  
end

target 'KBCApplication-Dev' do
  project 'KBCApplication.xcodeproj'
  app_pods
  shared_pods
end

target 'Core' do
    project 'Modules/Core/Core.xcodeproj'
    shared_pods
end

target 'UICore' do
    project 'Modules/UICore/UICore.xcodeproj'
    shared_pods
end

target 'Tasks' do
    project 'Modules/Tasks/Tasks.xcodeproj'
    shared_pods
end
