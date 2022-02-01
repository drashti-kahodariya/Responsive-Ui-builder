#import "ResponsiveUiBuilderPlugin.h"
#if __has_include(<responsive_ui_builder/responsive_ui_builder-Swift.h>)
#import <responsive_ui_builder/responsive_ui_builder-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "responsive_ui_builder-Swift.h"
#endif

@implementation ResponsiveUiBuilderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftResponsiveUiBuilderPlugin registerWithRegistrar:registrar];
}
@end
