#import "FlutterHmsGmsAvailabilityPlugin.h"
#if __has_include(<flutter_hms_gms_availability/flutter_hms_gms_availability-Swift.h>)
#import <flutter_hms_gms_availability/flutter_hms_gms_availability-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_hms_gms_availability-Swift.h"
#endif

@implementation FlutterHmsGmsAvailabilityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterHmsGmsAvailabilityPlugin registerWithRegistrar:registrar];
}
@end
