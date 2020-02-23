#import "AmapPlugin.h"
#if __has_include(<amap/amap-Swift.h>)
#import <amap/amap-Swift.h>

#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "amap-Swift.h"
#endif

@implementation AmapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAmapPlugin registerWithRegistrar:registrar];
}
@end
