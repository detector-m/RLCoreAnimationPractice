//
//  RLUIBaseProtocol.swift
//  RLCoreAnimationPractice
//
//  Created by Riven on 2021/11/29.
//

import Foundation


@objc protocol RLUIBaseProtocol: AnyObject {
    
    func addSubViews()
    
    func relayoutSubViews()
    
}

/*

# 依赖库源地址
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/idoosmart/IDOSmartSpec.git'
# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

workspace 'Letsfit.xcworkspace'

target 'Letsfit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Letsfit

pod 'MMKV'
#pod 'Moya'
pod 'Alamofire'
pod 'R.swift'
pod 'SnapKit'
pod 'Closures'
pod 'SwiftyJSON'
pod 'ObjectMapper'
pod 'CryptoSwift'
pod 'IQKeyboardManagerSwift'

#Firebase
pod 'Firebase/Crashlytics'
pod 'Firebase/Analytics'

#代码检查
#pod 'SwiftLint'

#图表
pod 'Charts', git:'https://github.com/mickamy/Charts.git'

#压缩
pod 'Zip'

#加载网络图片
#pod 'Kingfisher'

#pod 'GoogleMaps'

pod 'DeviceKit', '~> 4.0'

#数据库
pod 'RealmSwift', '~> 10.7.6'
pod 'WCDB'

pod 'KeychainAccess'

pod 'FSPagerView'
pod 'Parchment'
pod 'Kingfisher'
pod "KingfisherWebP"
pod 'loady'
pod 'Tiercel'

pod 'MJRefresh'

pod 'Protobuf','~>3.12.0'

#pod "Connectivity"

#日历
pod 'FSCalendar', '~> 2.8.2'

#客服系统
pod 'Mobilisten'

end

target 'HBDataManagerLib' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
#项目静态库工程，写上路径，不然cocoapods找不到的
project 'HBDataManagerLib/HBDataManagerLib.xcodeproj'

#数据库
pod 'RealmSwift', '~> 10.7.6'
pod 'WCDB'
pod 'Firebase/Analytics'

end

target 'HBCommonLib' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
#项目静态库工程，写上路径，不然cocoapods找不到的
project 'HBCommonLib/HBCommonLib.xcodeproj'

pod 'MMKV'
pod 'Firebase/Analytics'

end

 */
