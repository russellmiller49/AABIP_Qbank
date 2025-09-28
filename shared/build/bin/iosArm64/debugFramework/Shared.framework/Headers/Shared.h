#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSError.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

@class SharedAppEnvironmentCompanion, SharedFeatureFlagsService, SharedQuestionBankService, SharedQuizSessionService, SharedStudyPlannerService, SharedAppEnvironment, SharedAppRouteCompanion, SharedAppRoute, SharedAppRouteAnalytics, SharedKotlinArray<T>, SharedAppRouteDashboard, SharedAppRouteLeaderboard, SharedAppRouteProgressReport, SharedAppRouteQuestionExplorer, SharedQuizMode, SharedAppRouteQuizCompanion, SharedAppRouteQuiz, SharedAppRouteReview, SharedAppRouteSettings, SharedFeatureFlagKey, SharedFeatureFlagCompanion, SharedFeatureFlag, SharedKotlinEnumCompanion, SharedKotlinEnum<E>, SharedFeatureFlagKeyCompanion, SharedModuleDifficulty, SharedModuleCompanion, SharedModule, SharedModuleDifficultyCompanion, SharedStudyDifficulty, SharedQuestionStudyStateCompanion, SharedQuestionStudyState, SharedQuizModeCompanion, SharedQuizModeIncorrectOnly, SharedQuizModeModuleCompanion, SharedQuizModeModule, SharedQuizModeQuickStartCompanion, SharedQuizModeQuickStart, SharedQuizQuestion, SharedQuizModuleCompanion, SharedQuizModule, SharedQuizOptionCompanion, SharedQuizOption, SharedQuizQuestionCompanion, SharedQuizSessionConfigurationCompanion, SharedQuizSessionConfiguration, SharedQuizSessionQuestionCompanion, SharedQuizSessionQuestion, SharedQuizSessionQuestionReferenceCompanion, SharedQuizSessionQuestionReference, SharedQuizSessionStateCompanion, SharedQuizSessionState, SharedStudyDifficultyCompanion, SharedStudyProgressCompanion, SharedStudyProgress, SharedQuestionDTO, SharedModuleDTOCompanion, SharedModuleDTO, SharedOptionDTOCompanion, SharedOptionDTO, SharedQuestionBankDTOCompanion, SharedQuestionBankDTO, SharedQuestionDTOCompanion, SharedQuizSessionResults, SharedKotlinThrowable, SharedKotlinException, SharedKotlinRuntimeException, SharedKotlinIllegalStateException, SharedKotlinx_serialization_coreSerializersModule, SharedKotlinx_serialization_coreSerialKind, SharedKotlinNothing;

@protocol SharedKotlinx_serialization_coreKSerializer, SharedKotlinComparable, SharedKotlinx_coroutines_coreStateFlow, SharedKotlinx_serialization_coreEncoder, SharedKotlinx_serialization_coreSerialDescriptor, SharedKotlinx_serialization_coreSerializationStrategy, SharedKotlinx_serialization_coreDecoder, SharedKotlinx_serialization_coreDeserializationStrategy, SharedKotlinIterator, SharedKotlinx_coroutines_coreFlowCollector, SharedKotlinx_coroutines_coreFlow, SharedKotlinx_coroutines_coreSharedFlow, SharedKotlinx_serialization_coreCompositeEncoder, SharedKotlinAnnotation, SharedKotlinx_serialization_coreCompositeDecoder, SharedKotlinx_serialization_coreSerializersModuleCollector, SharedKotlinKClass, SharedKotlinKDeclarationContainer, SharedKotlinKAnnotatedElement, SharedKotlinKClassifier;

NS_ASSUME_NONNULL_BEGIN
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-warning-option"
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wnullability"

#pragma push_macro("_Nullable_result")
#if !__has_feature(nullability_nullable_result)
#undef _Nullable_result
#define _Nullable_result _Nullable
#endif

__attribute__((swift_name("KotlinBase")))
@interface SharedBase : NSObject
- (instancetype)init __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
+ (void)initialize __attribute__((objc_requires_super));
@end

@interface SharedBase (SharedBaseCopying) <NSCopying>
@end

__attribute__((swift_name("KotlinMutableSet")))
@interface SharedMutableSet<ObjectType> : NSMutableSet<ObjectType>
@end

__attribute__((swift_name("KotlinMutableDictionary")))
@interface SharedMutableDictionary<KeyType, ObjectType> : NSMutableDictionary<KeyType, ObjectType>
@end

@interface NSError (NSErrorSharedKotlinException)
@property (readonly) id _Nullable kotlinException;
@end

__attribute__((swift_name("KotlinNumber")))
@interface SharedNumber : NSNumber
- (instancetype)initWithChar:(char)value __attribute__((unavailable));
- (instancetype)initWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
- (instancetype)initWithShort:(short)value __attribute__((unavailable));
- (instancetype)initWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
- (instancetype)initWithInt:(int)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
- (instancetype)initWithLong:(long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
- (instancetype)initWithLongLong:(long long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
- (instancetype)initWithFloat:(float)value __attribute__((unavailable));
- (instancetype)initWithDouble:(double)value __attribute__((unavailable));
- (instancetype)initWithBool:(BOOL)value __attribute__((unavailable));
- (instancetype)initWithInteger:(NSInteger)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
+ (instancetype)numberWithChar:(char)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
+ (instancetype)numberWithShort:(short)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
+ (instancetype)numberWithInt:(int)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
+ (instancetype)numberWithLong:(long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
+ (instancetype)numberWithLongLong:(long long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
+ (instancetype)numberWithFloat:(float)value __attribute__((unavailable));
+ (instancetype)numberWithDouble:(double)value __attribute__((unavailable));
+ (instancetype)numberWithBool:(BOOL)value __attribute__((unavailable));
+ (instancetype)numberWithInteger:(NSInteger)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
@end

__attribute__((swift_name("KotlinByte")))
@interface SharedByte : SharedNumber
- (instancetype)initWithChar:(char)value;
+ (instancetype)numberWithChar:(char)value;
@end

__attribute__((swift_name("KotlinUByte")))
@interface SharedUByte : SharedNumber
- (instancetype)initWithUnsignedChar:(unsigned char)value;
+ (instancetype)numberWithUnsignedChar:(unsigned char)value;
@end

__attribute__((swift_name("KotlinShort")))
@interface SharedShort : SharedNumber
- (instancetype)initWithShort:(short)value;
+ (instancetype)numberWithShort:(short)value;
@end

__attribute__((swift_name("KotlinUShort")))
@interface SharedUShort : SharedNumber
- (instancetype)initWithUnsignedShort:(unsigned short)value;
+ (instancetype)numberWithUnsignedShort:(unsigned short)value;
@end

__attribute__((swift_name("KotlinInt")))
@interface SharedInt : SharedNumber
- (instancetype)initWithInt:(int)value;
+ (instancetype)numberWithInt:(int)value;
@end

__attribute__((swift_name("KotlinUInt")))
@interface SharedUInt : SharedNumber
- (instancetype)initWithUnsignedInt:(unsigned int)value;
+ (instancetype)numberWithUnsignedInt:(unsigned int)value;
@end

__attribute__((swift_name("KotlinLong")))
@interface SharedLong : SharedNumber
- (instancetype)initWithLongLong:(long long)value;
+ (instancetype)numberWithLongLong:(long long)value;
@end

__attribute__((swift_name("KotlinULong")))
@interface SharedULong : SharedNumber
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value;
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value;
@end

__attribute__((swift_name("KotlinFloat")))
@interface SharedFloat : SharedNumber
- (instancetype)initWithFloat:(float)value;
+ (instancetype)numberWithFloat:(float)value;
@end

__attribute__((swift_name("KotlinDouble")))
@interface SharedDouble : SharedNumber
- (instancetype)initWithDouble:(double)value;
+ (instancetype)numberWithDouble:(double)value;
@end

__attribute__((swift_name("KotlinBoolean")))
@interface SharedBoolean : SharedNumber
- (instancetype)initWithBool:(BOOL)value;
+ (instancetype)numberWithBool:(BOOL)value;
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppEnvironment")))
@interface SharedAppEnvironment : SharedBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property (class, readonly, getter=companion) SharedAppEnvironmentCompanion *companion __attribute__((swift_name("companion")));
@property (readonly) SharedFeatureFlagsService *featureFlagsService __attribute__((swift_name("featureFlagsService")));
@property (readonly) SharedQuestionBankService *questionBankService __attribute__((swift_name("questionBankService")));
@property (readonly) SharedQuizSessionService *quizSessionService __attribute__((swift_name("quizSessionService")));
@property (readonly) SharedStudyPlannerService *studyPlannerService __attribute__((swift_name("studyPlannerService")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppEnvironment.Companion")))
@interface SharedAppEnvironmentCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppEnvironmentCompanion *shared __attribute__((swift_name("shared")));
- (SharedAppEnvironment *)getInstance __attribute__((swift_name("getInstance()")));
@property (readonly) SharedAppEnvironment *shared __attribute__((swift_name("shared")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("AppRoute")))
@interface SharedAppRoute : SharedBase
@property (class, readonly, getter=companion) SharedAppRouteCompanion *companion __attribute__((swift_name("companion")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.Analytics")))
@interface SharedAppRouteAnalytics : SharedAppRoute
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)analytics __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppRouteAnalytics *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.Companion")))
@interface SharedAppRouteCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppRouteCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.Dashboard")))
@interface SharedAppRouteDashboard : SharedAppRoute
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)dashboard __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppRouteDashboard *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.Leaderboard")))
@interface SharedAppRouteLeaderboard : SharedAppRoute
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)leaderboard __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppRouteLeaderboard *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.ProgressReport")))
@interface SharedAppRouteProgressReport : SharedAppRoute
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)progressReport __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppRouteProgressReport *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.QuestionExplorer")))
@interface SharedAppRouteQuestionExplorer : SharedAppRoute
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)questionExplorer __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppRouteQuestionExplorer *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.Quiz")))
@interface SharedAppRouteQuiz : SharedAppRoute
- (instancetype)initWithMode:(SharedQuizMode *)mode __attribute__((swift_name("init(mode:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedAppRouteQuizCompanion *companion __attribute__((swift_name("companion")));
- (SharedAppRouteQuiz *)doCopyMode:(SharedQuizMode *)mode __attribute__((swift_name("doCopy(mode:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) SharedQuizMode *mode __attribute__((swift_name("mode")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.QuizCompanion")))
@interface SharedAppRouteQuizCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppRouteQuizCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.Review")))
@interface SharedAppRouteReview : SharedAppRoute
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)review __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppRouteReview *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AppRoute.Settings")))
@interface SharedAppRouteSettings : SharedAppRoute
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)settings __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAppRouteSettings *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("FeatureFlag")))
@interface SharedFeatureFlag : SharedBase
- (instancetype)initWithKey:(SharedFeatureFlagKey *)key enabled:(BOOL)enabled description:(NSString * _Nullable)description defaultValue:(BOOL)defaultValue __attribute__((swift_name("init(key:enabled:description:defaultValue:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedFeatureFlagCompanion *companion __attribute__((swift_name("companion")));
- (SharedFeatureFlag *)doCopyKey:(SharedFeatureFlagKey *)key enabled:(BOOL)enabled description:(NSString * _Nullable)description defaultValue:(BOOL)defaultValue __attribute__((swift_name("doCopy(key:enabled:description:defaultValue:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) BOOL defaultValue __attribute__((swift_name("defaultValue")));
@property (readonly) NSString * _Nullable description_ __attribute__((swift_name("description_")));
@property (readonly) BOOL enabled __attribute__((swift_name("enabled")));
@property (readonly) SharedFeatureFlagKey *key __attribute__((swift_name("key")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("FeatureFlag.Companion")))
@interface SharedFeatureFlagCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedFeatureFlagCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((swift_name("KotlinComparable")))
@protocol SharedKotlinComparable
@required
- (int32_t)compareToOther:(id _Nullable)other __attribute__((swift_name("compareTo(other:)")));
@end

__attribute__((swift_name("KotlinEnum")))
@interface SharedKotlinEnum<E> : SharedBase <SharedKotlinComparable>
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedKotlinEnumCompanion *companion __attribute__((swift_name("companion")));
- (int32_t)compareToOther:(E)other __attribute__((swift_name("compareTo(other:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) int32_t ordinal __attribute__((swift_name("ordinal")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("FeatureFlagKey")))
@interface SharedFeatureFlagKey : SharedKotlinEnum<SharedFeatureFlagKey *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) SharedFeatureFlagKeyCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) SharedFeatureFlagKey *enableAnalytics __attribute__((swift_name("enableAnalytics")));
@property (class, readonly) SharedFeatureFlagKey *enableLeaderboard __attribute__((swift_name("enableLeaderboard")));
@property (class, readonly) SharedFeatureFlagKey *enableOfflineMode __attribute__((swift_name("enableOfflineMode")));
@property (class, readonly) SharedFeatureFlagKey *enableDarkMode __attribute__((swift_name("enableDarkMode")));
@property (class, readonly) SharedFeatureFlagKey *enableNotifications __attribute__((swift_name("enableNotifications")));
@property (class, readonly) SharedFeatureFlagKey *enableSocialFeatures __attribute__((swift_name("enableSocialFeatures")));
@property (class, readonly) SharedFeatureFlagKey *enableAdvancedQuizModes __attribute__((swift_name("enableAdvancedQuizModes")));
@property (class, readonly) SharedFeatureFlagKey *enableProgressTracking __attribute__((swift_name("enableProgressTracking")));
@property (class, readonly) SharedFeatureFlagKey *enableQuestionExplorer __attribute__((swift_name("enableQuestionExplorer")));
@property (class, readonly) SharedFeatureFlagKey *enableStudyPlanner __attribute__((swift_name("enableStudyPlanner")));
+ (SharedKotlinArray<SharedFeatureFlagKey *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<SharedFeatureFlagKey *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("FeatureFlagKey.Companion")))
@interface SharedFeatureFlagKeyCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedFeatureFlagKeyCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Module")))
@interface SharedModule : SharedBase
- (instancetype)initWithId:(NSString *)id title:(NSString *)title description:(NSString *)description questionCount:(int32_t)questionCount estimatedTimeMinutes:(int32_t)estimatedTimeMinutes difficulty:(SharedModuleDifficulty *)difficulty __attribute__((swift_name("init(id:title:description:questionCount:estimatedTimeMinutes:difficulty:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedModuleCompanion *companion __attribute__((swift_name("companion")));
- (SharedModule *)doCopyId:(NSString *)id title:(NSString *)title description:(NSString *)description questionCount:(int32_t)questionCount estimatedTimeMinutes:(int32_t)estimatedTimeMinutes difficulty:(SharedModuleDifficulty *)difficulty __attribute__((swift_name("doCopy(id:title:description:questionCount:estimatedTimeMinutes:difficulty:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *description_ __attribute__((swift_name("description_")));
@property (readonly) SharedModuleDifficulty *difficulty __attribute__((swift_name("difficulty")));
@property (readonly) int32_t estimatedTimeMinutes __attribute__((swift_name("estimatedTimeMinutes")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) int32_t questionCount __attribute__((swift_name("questionCount")));
@property (readonly) NSString *title __attribute__((swift_name("title")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Module.Companion")))
@interface SharedModuleCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedModuleCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@property (readonly) NSArray<SharedModule *> *placeholder __attribute__((swift_name("placeholder")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Module.Difficulty")))
@interface SharedModuleDifficulty : SharedKotlinEnum<SharedModuleDifficulty *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) SharedModuleDifficultyCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) SharedModuleDifficulty *easy __attribute__((swift_name("easy")));
@property (class, readonly) SharedModuleDifficulty *moderate __attribute__((swift_name("moderate")));
@property (class, readonly) SharedModuleDifficulty *hard __attribute__((swift_name("hard")));
+ (SharedKotlinArray<SharedModuleDifficulty *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<SharedModuleDifficulty *> *entries __attribute__((swift_name("entries")));
@property (readonly) NSString *value __attribute__((swift_name("value")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Module.DifficultyCompanion")))
@interface SharedModuleDifficultyCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedModuleDifficultyCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuestionStudyState")))
@interface SharedQuestionStudyState : SharedBase
- (instancetype)initWithQuestionId:(NSString *)questionId moduleId:(NSString *)moduleId isCorrect:(BOOL)isCorrect isAnswered:(BOOL)isAnswered timesAnswered:(int32_t)timesAnswered timesCorrect:(int32_t)timesCorrect lastAnsweredAt:(SharedLong * _Nullable)lastAnsweredAt difficulty:(SharedStudyDifficulty *)difficulty __attribute__((swift_name("init(questionId:moduleId:isCorrect:isAnswered:timesAnswered:timesCorrect:lastAnsweredAt:difficulty:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuestionStudyStateCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuestionStudyState *)doCopyQuestionId:(NSString *)questionId moduleId:(NSString *)moduleId isCorrect:(BOOL)isCorrect isAnswered:(BOOL)isAnswered timesAnswered:(int32_t)timesAnswered timesCorrect:(int32_t)timesCorrect lastAnsweredAt:(SharedLong * _Nullable)lastAnsweredAt difficulty:(SharedStudyDifficulty *)difficulty __attribute__((swift_name("doCopy(questionId:moduleId:isCorrect:isAnswered:timesAnswered:timesCorrect:lastAnsweredAt:difficulty:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) float accuracy __attribute__((swift_name("accuracy")));
@property (readonly) SharedStudyDifficulty *difficulty __attribute__((swift_name("difficulty")));
@property (readonly) BOOL isAnswered __attribute__((swift_name("isAnswered")));
@property (readonly) BOOL isCorrect __attribute__((swift_name("isCorrect")));
@property (readonly) SharedLong * _Nullable lastAnsweredAt __attribute__((swift_name("lastAnsweredAt")));
@property (readonly) NSString *moduleId __attribute__((swift_name("moduleId")));
@property (readonly) BOOL needsReview __attribute__((swift_name("needsReview")));
@property (readonly) NSString *questionId __attribute__((swift_name("questionId")));
@property (readonly) int32_t timesAnswered __attribute__((swift_name("timesAnswered")));
@property (readonly) int32_t timesCorrect __attribute__((swift_name("timesCorrect")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuestionStudyState.Companion")))
@interface SharedQuestionStudyStateCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuestionStudyStateCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((swift_name("QuizMode")))
@interface SharedQuizMode : SharedBase
@property (class, readonly, getter=companion) SharedQuizModeCompanion *companion __attribute__((swift_name("companion")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizMode.Companion")))
@interface SharedQuizModeCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizModeCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizMode.IncorrectOnly")))
@interface SharedQuizModeIncorrectOnly : SharedQuizMode
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)incorrectOnly __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizModeIncorrectOnly *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizMode.Module")))
@interface SharedQuizModeModule : SharedQuizMode
- (instancetype)initWithId:(NSString *)id title:(NSString *)title __attribute__((swift_name("init(id:title:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuizModeModuleCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuizModeModule *)doCopyId:(NSString *)id title:(NSString *)title __attribute__((swift_name("doCopy(id:title:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) NSString *title __attribute__((swift_name("title")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizMode.ModuleCompanion")))
@interface SharedQuizModeModuleCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizModeModuleCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizMode.QuickStart")))
@interface SharedQuizModeQuickStart : SharedQuizMode
- (instancetype)initWithResume:(BOOL)resume __attribute__((swift_name("init(resume:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuizModeQuickStartCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuizModeQuickStart *)doCopyResume:(BOOL)resume __attribute__((swift_name("doCopy(resume:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) BOOL resume __attribute__((swift_name("resume")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizMode.QuickStartCompanion")))
@interface SharedQuizModeQuickStartCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizModeQuickStartCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizModule")))
@interface SharedQuizModule : SharedBase
- (instancetype)initWithSummary:(SharedModule *)summary questions:(NSArray<SharedQuizQuestion *> *)questions __attribute__((swift_name("init(summary:questions:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuizModuleCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuizModule *)doCopySummary:(SharedModule *)summary questions:(NSArray<SharedQuizQuestion *> *)questions __attribute__((swift_name("doCopy(summary:questions:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) NSArray<SharedQuizQuestion *> *questions __attribute__((swift_name("questions")));
@property (readonly) SharedModule *summary __attribute__((swift_name("summary")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizModule.Companion")))
@interface SharedQuizModuleCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizModuleCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizOption")))
@interface SharedQuizOption : SharedBase
- (instancetype)initWithId:(NSString *)id text:(NSString *)text imageURL:(NSString * _Nullable)imageURL __attribute__((swift_name("init(id:text:imageURL:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuizOptionCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuizOption *)doCopyId:(NSString *)id text:(NSString *)text imageURL:(NSString * _Nullable)imageURL __attribute__((swift_name("doCopy(id:text:imageURL:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) NSString * _Nullable imageURL __attribute__((swift_name("imageURL")));
@property (readonly) NSString *text __attribute__((swift_name("text")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizOption.Companion")))
@interface SharedQuizOptionCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizOptionCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizQuestion")))
@interface SharedQuizQuestion : SharedBase
- (instancetype)initWithId:(NSString *)id number:(int32_t)number prompt:(NSString *)prompt options:(NSArray<SharedQuizOption *> *)options correctOptionId:(NSString *)correctOptionId explanation:(NSString *)explanation references:(NSArray<NSString *> *)references imageURLs:(NSArray<NSString *> *)imageURLs explanationImageURLs:(NSArray<NSString *> *)explanationImageURLs __attribute__((swift_name("init(id:number:prompt:options:correctOptionId:explanation:references:imageURLs:explanationImageURLs:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuizQuestionCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuizQuestion *)doCopyId:(NSString *)id number:(int32_t)number prompt:(NSString *)prompt options:(NSArray<SharedQuizOption *> *)options correctOptionId:(NSString *)correctOptionId explanation:(NSString *)explanation references:(NSArray<NSString *> *)references imageURLs:(NSArray<NSString *> *)imageURLs explanationImageURLs:(NSArray<NSString *> *)explanationImageURLs __attribute__((swift_name("doCopy(id:number:prompt:options:correctOptionId:explanation:references:imageURLs:explanationImageURLs:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (SharedQuizOption * _Nullable)optionWithId:(NSString *)withId __attribute__((swift_name("option(withId:)")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *correctOptionId __attribute__((swift_name("correctOptionId")));
@property (readonly) NSString *explanation __attribute__((swift_name("explanation")));
@property (readonly) NSArray<NSString *> *explanationImageURLs __attribute__((swift_name("explanationImageURLs")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) NSArray<NSString *> *imageURLs __attribute__((swift_name("imageURLs")));
@property (readonly) int32_t number __attribute__((swift_name("number")));
@property (readonly) NSArray<SharedQuizOption *> *options __attribute__((swift_name("options")));
@property (readonly) NSString *prompt __attribute__((swift_name("prompt")));
@property (readonly) NSArray<NSString *> *references __attribute__((swift_name("references")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizQuestion.Companion")))
@interface SharedQuizQuestionCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizQuestionCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionConfiguration")))
@interface SharedQuizSessionConfiguration : SharedBase
- (instancetype)initWithMode:(SharedQuizMode *)mode questionLimit:(SharedInt * _Nullable)questionLimit timeLimitMinutes:(SharedInt * _Nullable)timeLimitMinutes shuffleQuestions:(BOOL)shuffleQuestions showExplanations:(BOOL)showExplanations __attribute__((swift_name("init(mode:questionLimit:timeLimitMinutes:shuffleQuestions:showExplanations:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuizSessionConfigurationCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuizSessionConfiguration *)doCopyMode:(SharedQuizMode *)mode questionLimit:(SharedInt * _Nullable)questionLimit timeLimitMinutes:(SharedInt * _Nullable)timeLimitMinutes shuffleQuestions:(BOOL)shuffleQuestions showExplanations:(BOOL)showExplanations __attribute__((swift_name("doCopy(mode:questionLimit:timeLimitMinutes:shuffleQuestions:showExplanations:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) SharedQuizMode *mode __attribute__((swift_name("mode")));
@property (readonly) SharedInt * _Nullable questionLimit __attribute__((swift_name("questionLimit")));
@property (readonly) BOOL showExplanations __attribute__((swift_name("showExplanations")));
@property (readonly) BOOL shuffleQuestions __attribute__((swift_name("shuffleQuestions")));
@property (readonly) SharedInt * _Nullable timeLimitMinutes __attribute__((swift_name("timeLimitMinutes")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionConfiguration.Companion")))
@interface SharedQuizSessionConfigurationCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizSessionConfigurationCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionQuestion")))
@interface SharedQuizSessionQuestion : SharedBase
- (instancetype)initWithModule:(SharedQuizModule *)module question:(SharedQuizQuestion *)question __attribute__((swift_name("init(module:question:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuizSessionQuestionCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuizSessionQuestion *)doCopyModule:(SharedQuizModule *)module question:(SharedQuizQuestion *)question __attribute__((swift_name("doCopy(module:question:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) SharedQuizModule *module __attribute__((swift_name("module")));
@property (readonly) SharedQuizQuestion *question __attribute__((swift_name("question")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionQuestion.Companion")))
@interface SharedQuizSessionQuestionCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizSessionQuestionCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionQuestionReference")))
@interface SharedQuizSessionQuestionReference : SharedBase
- (instancetype)initWithModuleID:(NSString *)moduleID questionID:(NSString *)questionID __attribute__((swift_name("init(moduleID:questionID:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuizSessionQuestionReferenceCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuizSessionQuestionReference *)doCopyModuleID:(NSString *)moduleID questionID:(NSString *)questionID __attribute__((swift_name("doCopy(moduleID:questionID:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *moduleID __attribute__((swift_name("moduleID")));
@property (readonly) NSString *questionID __attribute__((swift_name("questionID")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionQuestionReference.Companion")))
@interface SharedQuizSessionQuestionReferenceCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizSessionQuestionReferenceCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionState")))
@interface SharedQuizSessionState : SharedBase
- (instancetype)initWithConfiguration:(SharedQuizSessionConfiguration *)configuration questions:(NSArray<SharedQuizSessionQuestion *> *)questions currentQuestionIndex:(int32_t)currentQuestionIndex answers:(NSDictionary<NSString *, NSString *> *)answers startTime:(int64_t)startTime isCompleted:(BOOL)isCompleted __attribute__((swift_name("init(configuration:questions:currentQuestionIndex:answers:startTime:isCompleted:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuizSessionStateCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuizSessionState *)doCopyConfiguration:(SharedQuizSessionConfiguration *)configuration questions:(NSArray<SharedQuizSessionQuestion *> *)questions currentQuestionIndex:(int32_t)currentQuestionIndex answers:(NSDictionary<NSString *, NSString *> *)answers startTime:(int64_t)startTime isCompleted:(BOOL)isCompleted __attribute__((swift_name("doCopy(configuration:questions:currentQuestionIndex:answers:startTime:isCompleted:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSDictionary<NSString *, NSString *> *answers __attribute__((swift_name("answers")));
@property (readonly) SharedQuizSessionConfiguration *configuration __attribute__((swift_name("configuration")));
@property (readonly) SharedQuizSessionQuestion * _Nullable currentQuestion __attribute__((swift_name("currentQuestion")));
@property (readonly) int32_t currentQuestionIndex __attribute__((swift_name("currentQuestionIndex")));
@property (readonly) BOOL isCompleted __attribute__((swift_name("isCompleted")));
@property (readonly) BOOL isLastQuestion __attribute__((swift_name("isLastQuestion")));
@property (readonly) float progress __attribute__((swift_name("progress")));
@property (readonly) NSArray<SharedQuizSessionQuestion *> *questions __attribute__((swift_name("questions")));
@property (readonly) int32_t score __attribute__((swift_name("score")));
@property (readonly) int64_t startTime __attribute__((swift_name("startTime")));
@property (readonly) int32_t totalQuestions __attribute__((swift_name("totalQuestions")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionState.Companion")))
@interface SharedQuizSessionStateCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuizSessionStateCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("StudyDifficulty")))
@interface SharedStudyDifficulty : SharedKotlinEnum<SharedStudyDifficulty *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) SharedStudyDifficultyCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) SharedStudyDifficulty *unknown __attribute__((swift_name("unknown")));
@property (class, readonly) SharedStudyDifficulty *easy __attribute__((swift_name("easy")));
@property (class, readonly) SharedStudyDifficulty *medium __attribute__((swift_name("medium")));
@property (class, readonly) SharedStudyDifficulty *hard __attribute__((swift_name("hard")));
+ (SharedKotlinArray<SharedStudyDifficulty *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<SharedStudyDifficulty *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("StudyDifficulty.Companion")))
@interface SharedStudyDifficultyCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedStudyDifficultyCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("StudyProgress")))
@interface SharedStudyProgress : SharedBase
- (instancetype)initWithModuleId:(NSString *)moduleId totalQuestions:(int32_t)totalQuestions answeredQuestions:(int32_t)answeredQuestions correctAnswers:(int32_t)correctAnswers studyStates:(NSDictionary<NSString *, SharedQuestionStudyState *> *)studyStates __attribute__((swift_name("init(moduleId:totalQuestions:answeredQuestions:correctAnswers:studyStates:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedStudyProgressCompanion *companion __attribute__((swift_name("companion")));
- (SharedStudyProgress *)doCopyModuleId:(NSString *)moduleId totalQuestions:(int32_t)totalQuestions answeredQuestions:(int32_t)answeredQuestions correctAnswers:(int32_t)correctAnswers studyStates:(NSDictionary<NSString *, SharedQuestionStudyState *> *)studyStates __attribute__((swift_name("doCopy(moduleId:totalQuestions:answeredQuestions:correctAnswers:studyStates:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) float accuracy __attribute__((swift_name("accuracy")));
@property (readonly) int32_t answeredQuestions __attribute__((swift_name("answeredQuestions")));
@property (readonly) float completionPercentage __attribute__((swift_name("completionPercentage")));
@property (readonly) int32_t correctAnswers __attribute__((swift_name("correctAnswers")));
@property (readonly) NSString *moduleId __attribute__((swift_name("moduleId")));
@property (readonly) int32_t needsReviewCount __attribute__((swift_name("needsReviewCount")));
@property (readonly) NSDictionary<NSString *, SharedQuestionStudyState *> *studyStates __attribute__((swift_name("studyStates")));
@property (readonly) int32_t totalQuestions __attribute__((swift_name("totalQuestions")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("StudyProgress.Companion")))
@interface SharedStudyProgressCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedStudyProgressCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("FeatureFlagsService")))
@interface SharedFeatureFlagsService : SharedBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (SharedFeatureFlag * _Nullable)getFeatureFlagKey:(SharedFeatureFlagKey *)key __attribute__((swift_name("getFeatureFlag(key:)")));
- (BOOL)isFeatureEnabledKey:(SharedFeatureFlagKey *)key __attribute__((swift_name("isFeatureEnabled(key:)")));

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)refreshFromRemoteWithCompletionHandler:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("refreshFromRemote(completionHandler:)")));
- (void)updateFeatureFlagKey:(SharedFeatureFlagKey *)key enabled:(BOOL)enabled __attribute__((swift_name("updateFeatureFlag(key:enabled:)")));
- (void)updateFeatureFlagsFlags:(NSDictionary<SharedFeatureFlagKey *, SharedFeatureFlag *> *)flags __attribute__((swift_name("updateFeatureFlags(flags:)")));
@property (readonly) id<SharedKotlinx_coroutines_coreStateFlow> featureFlags __attribute__((swift_name("featureFlags")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ModuleDTO")))
@interface SharedModuleDTO : SharedBase
- (instancetype)initWithId:(NSString *)id title:(NSString *)title description:(NSString *)description estimatedTimeMinutes:(int32_t)estimatedTimeMinutes difficulty:(NSString *)difficulty questionCount:(int32_t)questionCount questions:(NSArray<SharedQuestionDTO *> *)questions __attribute__((swift_name("init(id:title:description:estimatedTimeMinutes:difficulty:questionCount:questions:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedModuleDTOCompanion *companion __attribute__((swift_name("companion")));
- (SharedModuleDTO *)doCopyId:(NSString *)id title:(NSString *)title description:(NSString *)description estimatedTimeMinutes:(int32_t)estimatedTimeMinutes difficulty:(NSString *)difficulty questionCount:(int32_t)questionCount questions:(NSArray<SharedQuestionDTO *> *)questions __attribute__((swift_name("doCopy(id:title:description:estimatedTimeMinutes:difficulty:questionCount:questions:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *description_ __attribute__((swift_name("description_")));
@property (readonly) NSString *difficulty __attribute__((swift_name("difficulty")));
@property (readonly) int32_t estimatedTimeMinutes __attribute__((swift_name("estimatedTimeMinutes")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) int32_t questionCount __attribute__((swift_name("questionCount")));
@property (readonly) NSArray<SharedQuestionDTO *> *questions __attribute__((swift_name("questions")));
@property (readonly) NSString *title __attribute__((swift_name("title")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ModuleDTO.Companion")))
@interface SharedModuleDTOCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedModuleDTOCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OptionDTO")))
@interface SharedOptionDTO : SharedBase
- (instancetype)initWithId:(NSString *)id text:(NSString *)text __attribute__((swift_name("init(id:text:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedOptionDTOCompanion *companion __attribute__((swift_name("companion")));
- (SharedOptionDTO *)doCopyId:(NSString *)id text:(NSString *)text __attribute__((swift_name("doCopy(id:text:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) NSString *text __attribute__((swift_name("text")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("OptionDTO.Companion")))
@interface SharedOptionDTOCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedOptionDTOCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuestionBankDTO")))
@interface SharedQuestionBankDTO : SharedBase
- (instancetype)initWithModules:(NSArray<SharedModuleDTO *> *)modules __attribute__((swift_name("init(modules:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuestionBankDTOCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuestionBankDTO *)doCopyModules:(NSArray<SharedModuleDTO *> *)modules __attribute__((swift_name("doCopy(modules:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSArray<SharedModuleDTO *> *modules __attribute__((swift_name("modules")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuestionBankDTO.Companion")))
@interface SharedQuestionBankDTOCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuestionBankDTOCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuestionBankService")))
@interface SharedQuestionBankService : SharedBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (NSArray<SharedQuizSessionQuestion *> *)allSessionQuestions __attribute__((swift_name("allSessionQuestions()")));
- (int32_t)moduleCount __attribute__((swift_name("moduleCount()")));
- (NSArray<SharedModule *> *)moduleSummaries __attribute__((swift_name("moduleSummaries()")));
- (NSArray<SharedQuizQuestion *> *)questionsModuleId:(NSString *)moduleId __attribute__((swift_name("questions(moduleId:)")));
- (NSArray<SharedQuizSessionQuestion *> *)quickStartQuestionsLimit:(int32_t)limit excluding:(NSSet<NSString *> *)excluding __attribute__((swift_name("quickStartQuestions(limit:excluding:)")));
- (SharedQuizModule * _Nullable)quizModuleId:(NSString *)id __attribute__((swift_name("quizModule(id:)")));
- (SharedQuizSessionQuestion * _Nullable)sessionQuestionReference:(SharedQuizSessionQuestionReference *)reference __attribute__((swift_name("sessionQuestion(reference:)")));
- (NSArray<SharedQuizSessionQuestion *> *)sessionQuestionsForModule:(NSString *)forModule __attribute__((swift_name("sessionQuestions(forModule:)")));
- (NSArray<SharedQuizSessionQuestion *> *)sessionQuestionsFrom:(NSArray<SharedQuizSessionQuestionReference *> *)from __attribute__((swift_name("sessionQuestions(from:)")));
- (NSArray<SharedQuizSessionQuestion *> *)sessionQuestionsForModule:(NSString *)forModule excluding:(NSSet<NSString *> *)excluding __attribute__((swift_name("sessionQuestions(forModule:excluding:)")));
@property (readonly) int32_t totalQuestionCount __attribute__((swift_name("totalQuestionCount")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuestionDTO")))
@interface SharedQuestionDTO : SharedBase
- (instancetype)initWithId:(NSString *)id number:(int32_t)number prompt:(NSString *)prompt options:(NSArray<SharedOptionDTO *> *)options correctOptionId:(NSString *)correctOptionId explanation:(NSString *)explanation references:(NSArray<NSString *> *)references imageURLs:(NSArray<NSString *> *)imageURLs __attribute__((swift_name("init(id:number:prompt:options:correctOptionId:explanation:references:imageURLs:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedQuestionDTOCompanion *companion __attribute__((swift_name("companion")));
- (SharedQuestionDTO *)doCopyId:(NSString *)id number:(int32_t)number prompt:(NSString *)prompt options:(NSArray<SharedOptionDTO *> *)options correctOptionId:(NSString *)correctOptionId explanation:(NSString *)explanation references:(NSArray<NSString *> *)references imageURLs:(NSArray<NSString *> *)imageURLs __attribute__((swift_name("doCopy(id:number:prompt:options:correctOptionId:explanation:references:imageURLs:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *correctOptionId __attribute__((swift_name("correctOptionId")));
@property (readonly) NSString *explanation __attribute__((swift_name("explanation")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) NSArray<NSString *> *imageURLs __attribute__((swift_name("imageURLs")));
@property (readonly) int32_t number __attribute__((swift_name("number")));
@property (readonly) NSArray<SharedOptionDTO *> *options __attribute__((swift_name("options")));
@property (readonly) NSString *prompt __attribute__((swift_name("prompt")));
@property (readonly) NSArray<NSString *> *references __attribute__((swift_name("references")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuestionDTO.Companion")))
@interface SharedQuestionDTOCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedQuestionDTOCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionResults")))
@interface SharedQuizSessionResults : SharedBase
- (instancetype)initWithSession:(SharedQuizSessionState *)session score:(int32_t)score totalQuestions:(int32_t)totalQuestions accuracy:(float)accuracy timeSpent:(int64_t)timeSpent questionsAnswered:(int32_t)questionsAnswered __attribute__((swift_name("init(session:score:totalQuestions:accuracy:timeSpent:questionsAnswered:)"))) __attribute__((objc_designated_initializer));
- (SharedQuizSessionResults *)doCopySession:(SharedQuizSessionState *)session score:(int32_t)score totalQuestions:(int32_t)totalQuestions accuracy:(float)accuracy timeSpent:(int64_t)timeSpent questionsAnswered:(int32_t)questionsAnswered __attribute__((swift_name("doCopy(session:score:totalQuestions:accuracy:timeSpent:questionsAnswered:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) float accuracy __attribute__((swift_name("accuracy")));
@property (readonly) int32_t questionsAnswered __attribute__((swift_name("questionsAnswered")));
@property (readonly) int32_t score __attribute__((swift_name("score")));
@property (readonly) SharedQuizSessionState *session __attribute__((swift_name("session")));
@property (readonly) int64_t timeSpent __attribute__((swift_name("timeSpent")));
@property (readonly) int32_t totalQuestions __attribute__((swift_name("totalQuestions")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("QuizSessionService")))
@interface SharedQuizSessionService : SharedBase
- (instancetype)initWithQuestionBankService:(SharedQuestionBankService *)questionBankService studyPlannerService:(SharedStudyPlannerService *)studyPlannerService __attribute__((swift_name("init(questionBankService:studyPlannerService:)"))) __attribute__((objc_designated_initializer));
- (void)answerQuestionQuestionId:(NSString *)questionId answerId:(NSString *)answerId __attribute__((swift_name("answerQuestion(questionId:answerId:)")));
- (void)completeSession __attribute__((swift_name("completeSession()")));
- (void)endSession __attribute__((swift_name("endSession()")));
- (SharedQuizSessionResults * _Nullable)getSessionResults __attribute__((swift_name("getSessionResults()")));
- (BOOL)goToQuestionIndex:(int32_t)index __attribute__((swift_name("goToQuestion(index:)")));
- (BOOL)nextQuestion __attribute__((swift_name("nextQuestion()")));
- (BOOL)previousQuestion __attribute__((swift_name("previousQuestion()")));
- (SharedQuizSessionState *)startSessionConfiguration:(SharedQuizSessionConfiguration *)configuration __attribute__((swift_name("startSession(configuration:)")));
@property (readonly) id<SharedKotlinx_coroutines_coreStateFlow> currentSession __attribute__((swift_name("currentSession")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("StudyPlannerService")))
@interface SharedStudyPlannerService : SharedBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (SharedStudyProgress * _Nullable)getModuleProgressModuleId:(NSString *)moduleId __attribute__((swift_name("getModuleProgress(moduleId:)")));
- (SharedStudyProgress *)getOverallProgress __attribute__((swift_name("getOverallProgress()")));
- (SharedQuestionStudyState * _Nullable)getQuestionStateQuestionId:(NSString *)questionId __attribute__((swift_name("getQuestionState(questionId:)")));
- (NSArray<SharedQuestionStudyState *> *)getQuestionsNeedingReviewModuleId:(NSString * _Nullable)moduleId __attribute__((swift_name("getQuestionsNeedingReview(moduleId:)")));
- (void)resetProgressModuleId:(NSString * _Nullable)moduleId __attribute__((swift_name("resetProgress(moduleId:)")));
- (void)updateQuestionStateQuestionId:(NSString *)questionId moduleId:(NSString *)moduleId isCorrect:(BOOL)isCorrect isAnswered:(BOOL)isAnswered __attribute__((swift_name("updateQuestionState(questionId:moduleId:isCorrect:isAnswered:)")));
@property (readonly) id<SharedKotlinx_coroutines_coreStateFlow> questionStudyStates __attribute__((swift_name("questionStudyStates")));
@property (readonly) id<SharedKotlinx_coroutines_coreStateFlow> studyProgress __attribute__((swift_name("studyProgress")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Greeter")))
@interface SharedGreeter : SharedBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (NSString *)helloName:(NSString *)name __attribute__((swift_name("hello(name:)")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerializationStrategy")))
@protocol SharedKotlinx_serialization_coreSerializationStrategy
@required
- (void)serializeEncoder:(id<SharedKotlinx_serialization_coreEncoder>)encoder value:(id _Nullable)value __attribute__((swift_name("serialize(encoder:value:)")));
@property (readonly) id<SharedKotlinx_serialization_coreSerialDescriptor> descriptor __attribute__((swift_name("descriptor")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreDeserializationStrategy")))
@protocol SharedKotlinx_serialization_coreDeserializationStrategy
@required
- (id _Nullable)deserializeDecoder:(id<SharedKotlinx_serialization_coreDecoder>)decoder __attribute__((swift_name("deserialize(decoder:)")));
@property (readonly) id<SharedKotlinx_serialization_coreSerialDescriptor> descriptor __attribute__((swift_name("descriptor")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreKSerializer")))
@protocol SharedKotlinx_serialization_coreKSerializer <SharedKotlinx_serialization_coreSerializationStrategy, SharedKotlinx_serialization_coreDeserializationStrategy>
@required
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinArray")))
@interface SharedKotlinArray<T> : SharedBase
+ (instancetype)arrayWithSize:(int32_t)size init:(T _Nullable (^)(SharedInt *))init __attribute__((swift_name("init(size:init:)")));
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (T _Nullable)getIndex:(int32_t)index __attribute__((swift_name("get(index:)")));
- (id<SharedKotlinIterator>)iterator __attribute__((swift_name("iterator()")));
- (void)setIndex:(int32_t)index value:(T _Nullable)value __attribute__((swift_name("set(index:value:)")));
@property (readonly) int32_t size __attribute__((swift_name("size")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinEnumCompanion")))
@interface SharedKotlinEnumCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedKotlinEnumCompanion *shared __attribute__((swift_name("shared")));
@end

__attribute__((swift_name("KotlinThrowable")))
@interface SharedKotlinThrowable : SharedBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));

/**
 * @note annotations
 *   kotlin.experimental.ExperimentalNativeApi
*/
- (SharedKotlinArray<NSString *> *)getStackTrace __attribute__((swift_name("getStackTrace()")));
- (void)printStackTrace __attribute__((swift_name("printStackTrace()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) SharedKotlinThrowable * _Nullable cause __attribute__((swift_name("cause")));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
- (NSError *)asError __attribute__((swift_name("asError()")));
@end

__attribute__((swift_name("KotlinException")))
@interface SharedKotlinException : SharedKotlinThrowable
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((swift_name("KotlinRuntimeException")))
@interface SharedKotlinRuntimeException : SharedKotlinException
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((swift_name("KotlinIllegalStateException")))
@interface SharedKotlinIllegalStateException : SharedKotlinRuntimeException
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.4")
*/
__attribute__((swift_name("KotlinCancellationException")))
@interface SharedKotlinCancellationException : SharedKotlinIllegalStateException
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(SharedKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreFlow")))
@protocol SharedKotlinx_coroutines_coreFlow
@required

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)collectCollector:(id<SharedKotlinx_coroutines_coreFlowCollector>)collector completionHandler:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("collect(collector:completionHandler:)")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreSharedFlow")))
@protocol SharedKotlinx_coroutines_coreSharedFlow <SharedKotlinx_coroutines_coreFlow>
@required
@property (readonly) NSArray<id> *replayCache __attribute__((swift_name("replayCache")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreStateFlow")))
@protocol SharedKotlinx_coroutines_coreStateFlow <SharedKotlinx_coroutines_coreSharedFlow>
@required
@property (readonly) id _Nullable value __attribute__((swift_name("value")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreEncoder")))
@protocol SharedKotlinx_serialization_coreEncoder
@required
- (id<SharedKotlinx_serialization_coreCompositeEncoder>)beginCollectionDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor collectionSize:(int32_t)collectionSize __attribute__((swift_name("beginCollection(descriptor:collectionSize:)")));
- (id<SharedKotlinx_serialization_coreCompositeEncoder>)beginStructureDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("beginStructure(descriptor:)")));
- (void)encodeBooleanValue:(BOOL)value __attribute__((swift_name("encodeBoolean(value:)")));
- (void)encodeByteValue:(int8_t)value __attribute__((swift_name("encodeByte(value:)")));
- (void)encodeCharValue:(unichar)value __attribute__((swift_name("encodeChar(value:)")));
- (void)encodeDoubleValue:(double)value __attribute__((swift_name("encodeDouble(value:)")));
- (void)encodeEnumEnumDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)enumDescriptor index:(int32_t)index __attribute__((swift_name("encodeEnum(enumDescriptor:index:)")));
- (void)encodeFloatValue:(float)value __attribute__((swift_name("encodeFloat(value:)")));
- (id<SharedKotlinx_serialization_coreEncoder>)encodeInlineDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("encodeInline(descriptor:)")));
- (void)encodeIntValue:(int32_t)value __attribute__((swift_name("encodeInt(value:)")));
- (void)encodeLongValue:(int64_t)value __attribute__((swift_name("encodeLong(value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNotNullMark __attribute__((swift_name("encodeNotNullMark()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNull __attribute__((swift_name("encodeNull()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNullableSerializableValueSerializer:(id<SharedKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeNullableSerializableValue(serializer:value:)")));
- (void)encodeSerializableValueSerializer:(id<SharedKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeSerializableValue(serializer:value:)")));
- (void)encodeShortValue:(int16_t)value __attribute__((swift_name("encodeShort(value:)")));
- (void)encodeStringValue:(NSString *)value __attribute__((swift_name("encodeString(value:)")));
@property (readonly) SharedKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerialDescriptor")))
@protocol SharedKotlinx_serialization_coreSerialDescriptor
@required

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (NSArray<id<SharedKotlinAnnotation>> *)getElementAnnotationsIndex:(int32_t)index __attribute__((swift_name("getElementAnnotations(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<SharedKotlinx_serialization_coreSerialDescriptor>)getElementDescriptorIndex:(int32_t)index __attribute__((swift_name("getElementDescriptor(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (int32_t)getElementIndexName:(NSString *)name __attribute__((swift_name("getElementIndex(name:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (NSString *)getElementNameIndex:(int32_t)index __attribute__((swift_name("getElementName(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)isElementOptionalIndex:(int32_t)index __attribute__((swift_name("isElementOptional(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NSArray<id<SharedKotlinAnnotation>> *annotations __attribute__((swift_name("annotations")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) int32_t elementsCount __attribute__((swift_name("elementsCount")));
@property (readonly) BOOL isInline __attribute__((swift_name("isInline")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) BOOL isNullable __attribute__((swift_name("isNullable")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) SharedKotlinx_serialization_coreSerialKind *kind __attribute__((swift_name("kind")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NSString *serialName __attribute__((swift_name("serialName")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreDecoder")))
@protocol SharedKotlinx_serialization_coreDecoder
@required
- (id<SharedKotlinx_serialization_coreCompositeDecoder>)beginStructureDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("beginStructure(descriptor:)")));
- (BOOL)decodeBoolean __attribute__((swift_name("decodeBoolean()")));
- (int8_t)decodeByte __attribute__((swift_name("decodeByte()")));
- (unichar)decodeChar __attribute__((swift_name("decodeChar()")));
- (double)decodeDouble __attribute__((swift_name("decodeDouble()")));
- (int32_t)decodeEnumEnumDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)enumDescriptor __attribute__((swift_name("decodeEnum(enumDescriptor:)")));
- (float)decodeFloat __attribute__((swift_name("decodeFloat()")));
- (id<SharedKotlinx_serialization_coreDecoder>)decodeInlineDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeInline(descriptor:)")));
- (int32_t)decodeInt __attribute__((swift_name("decodeInt()")));
- (int64_t)decodeLong __attribute__((swift_name("decodeLong()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)decodeNotNullMark __attribute__((swift_name("decodeNotNullMark()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (SharedKotlinNothing * _Nullable)decodeNull __attribute__((swift_name("decodeNull()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id _Nullable)decodeNullableSerializableValueDeserializer:(id<SharedKotlinx_serialization_coreDeserializationStrategy>)deserializer __attribute__((swift_name("decodeNullableSerializableValue(deserializer:)")));
- (id _Nullable)decodeSerializableValueDeserializer:(id<SharedKotlinx_serialization_coreDeserializationStrategy>)deserializer __attribute__((swift_name("decodeSerializableValue(deserializer:)")));
- (int16_t)decodeShort __attribute__((swift_name("decodeShort()")));
- (NSString *)decodeString __attribute__((swift_name("decodeString()")));
@property (readonly) SharedKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("KotlinIterator")))
@protocol SharedKotlinIterator
@required
- (BOOL)hasNext __attribute__((swift_name("hasNext()")));
- (id _Nullable)next __attribute__((swift_name("next()")));
@end

__attribute__((swift_name("Kotlinx_coroutines_coreFlowCollector")))
@protocol SharedKotlinx_coroutines_coreFlowCollector
@required

/**
 * @note This method converts instances of CancellationException to errors.
 * Other uncaught Kotlin exceptions are fatal.
*/
- (void)emitValue:(id _Nullable)value completionHandler:(void (^)(NSError * _Nullable))completionHandler __attribute__((swift_name("emit(value:completionHandler:)")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreCompositeEncoder")))
@protocol SharedKotlinx_serialization_coreCompositeEncoder
@required
- (void)encodeBooleanElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(BOOL)value __attribute__((swift_name("encodeBooleanElement(descriptor:index:value:)")));
- (void)encodeByteElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int8_t)value __attribute__((swift_name("encodeByteElement(descriptor:index:value:)")));
- (void)encodeCharElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(unichar)value __attribute__((swift_name("encodeCharElement(descriptor:index:value:)")));
- (void)encodeDoubleElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(double)value __attribute__((swift_name("encodeDoubleElement(descriptor:index:value:)")));
- (void)encodeFloatElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(float)value __attribute__((swift_name("encodeFloatElement(descriptor:index:value:)")));
- (id<SharedKotlinx_serialization_coreEncoder>)encodeInlineElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("encodeInlineElement(descriptor:index:)")));
- (void)encodeIntElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int32_t)value __attribute__((swift_name("encodeIntElement(descriptor:index:value:)")));
- (void)encodeLongElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int64_t)value __attribute__((swift_name("encodeLongElement(descriptor:index:value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNullableSerializableElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index serializer:(id<SharedKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeNullableSerializableElement(descriptor:index:serializer:value:)")));
- (void)encodeSerializableElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index serializer:(id<SharedKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeSerializableElement(descriptor:index:serializer:value:)")));
- (void)encodeShortElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int16_t)value __attribute__((swift_name("encodeShortElement(descriptor:index:value:)")));
- (void)encodeStringElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(NSString *)value __attribute__((swift_name("encodeStringElement(descriptor:index:value:)")));
- (void)endStructureDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("endStructure(descriptor:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)shouldEncodeElementDefaultDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("shouldEncodeElementDefault(descriptor:index:)")));
@property (readonly) SharedKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerializersModule")))
@interface SharedKotlinx_serialization_coreSerializersModule : SharedBase

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)dumpToCollector:(id<SharedKotlinx_serialization_coreSerializersModuleCollector>)collector __attribute__((swift_name("dumpTo(collector:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<SharedKotlinx_serialization_coreKSerializer> _Nullable)getContextualKClass:(id<SharedKotlinKClass>)kClass typeArgumentsSerializers:(NSArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeArgumentsSerializers __attribute__((swift_name("getContextual(kClass:typeArgumentsSerializers:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<SharedKotlinx_serialization_coreSerializationStrategy> _Nullable)getPolymorphicBaseClass:(id<SharedKotlinKClass>)baseClass value:(id)value __attribute__((swift_name("getPolymorphic(baseClass:value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<SharedKotlinx_serialization_coreDeserializationStrategy> _Nullable)getPolymorphicBaseClass:(id<SharedKotlinKClass>)baseClass serializedClassName:(NSString * _Nullable)serializedClassName __attribute__((swift_name("getPolymorphic(baseClass:serializedClassName:)")));
@end

__attribute__((swift_name("KotlinAnnotation")))
@protocol SharedKotlinAnnotation
@required
@end


/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
__attribute__((swift_name("Kotlinx_serialization_coreSerialKind")))
@interface SharedKotlinx_serialization_coreSerialKind : SharedBase
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreCompositeDecoder")))
@protocol SharedKotlinx_serialization_coreCompositeDecoder
@required
- (BOOL)decodeBooleanElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeBooleanElement(descriptor:index:)")));
- (int8_t)decodeByteElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeByteElement(descriptor:index:)")));
- (unichar)decodeCharElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeCharElement(descriptor:index:)")));
- (int32_t)decodeCollectionSizeDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeCollectionSize(descriptor:)")));
- (double)decodeDoubleElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeDoubleElement(descriptor:index:)")));
- (int32_t)decodeElementIndexDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeElementIndex(descriptor:)")));
- (float)decodeFloatElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeFloatElement(descriptor:index:)")));
- (id<SharedKotlinx_serialization_coreDecoder>)decodeInlineElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeInlineElement(descriptor:index:)")));
- (int32_t)decodeIntElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeIntElement(descriptor:index:)")));
- (int64_t)decodeLongElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeLongElement(descriptor:index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id _Nullable)decodeNullableSerializableElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index deserializer:(id<SharedKotlinx_serialization_coreDeserializationStrategy>)deserializer previousValue:(id _Nullable)previousValue __attribute__((swift_name("decodeNullableSerializableElement(descriptor:index:deserializer:previousValue:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)decodeSequentially __attribute__((swift_name("decodeSequentially()")));
- (id _Nullable)decodeSerializableElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index deserializer:(id<SharedKotlinx_serialization_coreDeserializationStrategy>)deserializer previousValue:(id _Nullable)previousValue __attribute__((swift_name("decodeSerializableElement(descriptor:index:deserializer:previousValue:)")));
- (int16_t)decodeShortElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeShortElement(descriptor:index:)")));
- (NSString *)decodeStringElementDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeStringElement(descriptor:index:)")));
- (void)endStructureDescriptor:(id<SharedKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("endStructure(descriptor:)")));
@property (readonly) SharedKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinNothing")))
@interface SharedKotlinNothing : SharedBase
@end


/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
__attribute__((swift_name("Kotlinx_serialization_coreSerializersModuleCollector")))
@protocol SharedKotlinx_serialization_coreSerializersModuleCollector
@required
- (void)contextualKClass:(id<SharedKotlinKClass>)kClass provider:(id<SharedKotlinx_serialization_coreKSerializer> (^)(NSArray<id<SharedKotlinx_serialization_coreKSerializer>> *))provider __attribute__((swift_name("contextual(kClass:provider:)")));
- (void)contextualKClass:(id<SharedKotlinKClass>)kClass serializer:(id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("contextual(kClass:serializer:)")));
- (void)polymorphicBaseClass:(id<SharedKotlinKClass>)baseClass actualClass:(id<SharedKotlinKClass>)actualClass actualSerializer:(id<SharedKotlinx_serialization_coreKSerializer>)actualSerializer __attribute__((swift_name("polymorphic(baseClass:actualClass:actualSerializer:)")));
- (void)polymorphicDefaultBaseClass:(id<SharedKotlinKClass>)baseClass defaultDeserializerProvider:(id<SharedKotlinx_serialization_coreDeserializationStrategy> _Nullable (^)(NSString * _Nullable))defaultDeserializerProvider __attribute__((swift_name("polymorphicDefault(baseClass:defaultDeserializerProvider:)"))) __attribute__((deprecated("Deprecated in favor of function with more precise name: polymorphicDefaultDeserializer")));
- (void)polymorphicDefaultDeserializerBaseClass:(id<SharedKotlinKClass>)baseClass defaultDeserializerProvider:(id<SharedKotlinx_serialization_coreDeserializationStrategy> _Nullable (^)(NSString * _Nullable))defaultDeserializerProvider __attribute__((swift_name("polymorphicDefaultDeserializer(baseClass:defaultDeserializerProvider:)")));
- (void)polymorphicDefaultSerializerBaseClass:(id<SharedKotlinKClass>)baseClass defaultSerializerProvider:(id<SharedKotlinx_serialization_coreSerializationStrategy> _Nullable (^)(id))defaultSerializerProvider __attribute__((swift_name("polymorphicDefaultSerializer(baseClass:defaultSerializerProvider:)")));
@end

__attribute__((swift_name("KotlinKDeclarationContainer")))
@protocol SharedKotlinKDeclarationContainer
@required
@end

__attribute__((swift_name("KotlinKAnnotatedElement")))
@protocol SharedKotlinKAnnotatedElement
@required
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
__attribute__((swift_name("KotlinKClassifier")))
@protocol SharedKotlinKClassifier
@required
@end

__attribute__((swift_name("KotlinKClass")))
@protocol SharedKotlinKClass <SharedKotlinKDeclarationContainer, SharedKotlinKAnnotatedElement, SharedKotlinKClassifier>
@required

/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
- (BOOL)isInstanceValue:(id _Nullable)value __attribute__((swift_name("isInstance(value:)")));
@property (readonly) NSString * _Nullable qualifiedName __attribute__((swift_name("qualifiedName")));
@property (readonly) NSString * _Nullable simpleName __attribute__((swift_name("simpleName")));
@end

#pragma pop_macro("_Nullable_result")
#pragma clang diagnostic pop
NS_ASSUME_NONNULL_END
