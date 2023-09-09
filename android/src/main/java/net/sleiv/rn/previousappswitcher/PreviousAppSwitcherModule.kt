package net.sleiv.rn.previousappswitcher

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class PreviousAppSwitcherModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  @ReactMethod
  fun switchBack(promise: Promise) {
    try {
      currentActivity?.run {
        moveTaskToBack(true)
        promise.resolve(true)
      } ?: promise.reject("NO_ACTIVITY", "Current activity not found.")
    } catch (e: Exception) {
      promise.reject("ERROR", "An error occurred while moving task to back.", e)
    }
  }


  companion object {
    const val NAME = "PreviousAppSwitcher"
  }
}
