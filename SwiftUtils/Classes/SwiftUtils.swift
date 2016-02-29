//
//  Type.swift
//  SwiftUtils
//
//  Created by DaoNV on 12/30/15.
//  Copyright © 2015 Astraler Technology. All rights reserved.
//

import UIKit

public typealias JSObject = [String : AnyObject]
public typealias JSArray = [JSObject]

public enum DeviceType: Int {
  case iPhone4
  case iPhone5
  case iPhone6
  case iPhone6p
  case iPad
  
  var size: CGSize {
    switch self {
    case .iPhone4:  return CGSize(width: 320, height: 480)
    case .iPhone5:  return CGSize(width: 320, height: 568)
    case .iPhone6:  return CGSize(width: 375, height: 667)
    case .iPhone6p: return CGSize(width: 414, height: 736)
    case .iPad:     return CGSize(width: 768, height: 1024)
    }
  }
}

public let kScreenSize = UIScreen.mainScreen().bounds.size

public let iPhone = (UIDevice.currentDevice().userInterfaceIdiom == .Phone)
public let iPad = (UIDevice.currentDevice().userInterfaceIdiom == .Pad)

public let iPhone4    = (iPhone && DeviceType.iPhone4.size  == kScreenSize)
public let iPhone5    = (iPhone && DeviceType.iPhone5.size  == kScreenSize)
public let iPhone6    = (iPhone && DeviceType.iPhone6.size  == kScreenSize)
public let iPhone6s   = (iPhone && DeviceType.iPhone6p.size == kScreenSize)