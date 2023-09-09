import Foundation
import UIKit
import React

@objc private protocol PrivateSelectors: NSObjectProtocol {
    var destinations: [NSNumber] { get }
    func sendResponseForDestination(_ destination: NSNumber)
}

@objc(PreviousAppSwitcher)
class PreviousAppSwitcher: NSObject, RCTBridgeModule {
  static func moduleName() -> String {
    return "PreviousAppSwitcher"
  }

  @objc func switchBack(_ resolver: RCTPromiseResolveBlock,
                               rejecter: RCTPromiseRejectBlock) {
      guard
          let sysNavIvar = class_getInstanceVariable(UIApplication.self, "_systemNavigationAction"),
          let action = object_getIvar(UIApplication.shared, sysNavIvar) as? NSObject,
          let destinations = action.perform(#selector(getter: PrivateSelectors.destinations))?.takeUnretainedValue() as? [NSNumber],
          let firstDestination = destinations.first
      else {
          rejecter("NO_NAVIGATION_ACTION", "System navigation action or destination not found.", nil)
          return
      }

      action.perform(#selector(PrivateSelectors.sendResponseForDestination), with: firstDestination)
      resolver(nil)
  }
}
