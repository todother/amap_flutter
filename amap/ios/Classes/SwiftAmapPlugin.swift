import Flutter
import UIKit

public class SwiftAmapPlugin: NSObject, FlutterPlugin {
    
    public func initAmap(key:String){
        AMapServices.shared()?.apiKey=key
    }
  public static func register(with registrar: FlutterPluginRegistrar) {
    
    let channel = FlutterMethodChannel(name: "amap", binaryMessenger: registrar.messenger())
    let instance = SwiftAmapPlugin()
    let gaodeMapFactory=GaodeMapFactory()
    registrar.register(gaodeMapFactory, withId: "gaodeMap")
//    registrar(forPlugin: "gaodeMap").register(gaodeMapFactory, withId: "gaodeMap")
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "init":
        let params=call.arguments as! Dictionary<String,String>
        let key=params["key"]!
        initAmap(key:key )
        result(["result":"OK"])
    default:
        result(FlutterMethodNotImplemented)
    }
  }
}
