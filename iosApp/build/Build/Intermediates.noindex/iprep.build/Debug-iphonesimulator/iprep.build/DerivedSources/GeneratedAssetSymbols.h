#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.russellmiller.iprep";

/// The "Accent" asset catalog color resource.
static NSString * const ACColorNameAccent AC_SWIFT_PRIVATE = @"Accent";

/// The "Background" asset catalog color resource.
static NSString * const ACColorNameBackground AC_SWIFT_PRIVATE = @"Background";

/// The "MutedAccent" asset catalog color resource.
static NSString * const ACColorNameMutedAccent AC_SWIFT_PRIVATE = @"MutedAccent";

/// The "Surface" asset catalog color resource.
static NSString * const ACColorNameSurface AC_SWIFT_PRIVATE = @"Surface";

/// The "SurfaceElevated" asset catalog color resource.
static NSString * const ACColorNameSurfaceElevated AC_SWIFT_PRIVATE = @"SurfaceElevated";

/// The "AABIPLogo" asset catalog image resource.
static NSString * const ACImageNameAABIPLogo AC_SWIFT_PRIVATE = @"AABIPLogo";

#undef AC_SWIFT_PRIVATE
