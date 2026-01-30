#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSError.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

@class SharedAppEnvironmentCompanion, SharedDuelEngineService, SharedDuelQuestionBankService, SharedFeatureFlagsService, SharedQuestionBankService, SharedQuizSessionService, SharedStudyPlannerService, SharedAppEnvironment, SharedAssetEntryCompanion, SharedAssetEntry, SharedAssetsManifest, SharedAssetsManifestCompanion, SharedAnswerResultCompanion, SharedAnswerResult, SharedAppRouteCompanion, SharedAppRoute, SharedAppRouteAnalytics, SharedKotlinArray<T>, SharedAppRouteDashboard, SharedAppRouteLeaderboard, SharedAppRouteProgressReport, SharedAppRouteQuestionExplorer, SharedQuizMode, SharedAppRouteQuizCompanion, SharedAppRouteQuiz, SharedAppRouteReview, SharedAppRouteSettings, SharedCompletedDuelCompanion, SharedCompletedDuel, SharedPlayerProfile, SharedDuelPersistenceDataCompanion, SharedDuelPersistenceData, SharedKotlinEnumCompanion, SharedKotlinEnum<E>, SharedDuelPhaseCompanion, SharedDuelPhase, SharedDuelQuestionCompanion, SharedDuelQuestion, SharedLifelineState, SharedDuelStateCompanion, SharedDuelState, SharedEnemy, SharedEnemyDefinitions, SharedFeatureFlagKey, SharedFeatureFlagCompanion, SharedFeatureFlag, SharedFeatureFlagKeyCompanion, SharedLifelineCompanion, SharedLifeline, SharedLifelineStateCompanion, SharedModuleDifficulty, SharedModuleCompanion, SharedModule, SharedModuleDifficultyCompanion, SharedPlayerProfileCompanion, SharedStudyDifficulty, SharedQuestionStudyStateCompanion, SharedQuestionStudyState, SharedQuizModeCompanion, SharedQuizModeIncorrectOnly, SharedQuizModeModuleCompanion, SharedQuizModeModule, SharedQuizModeQuickStartCompanion, SharedQuizModeQuickStart, SharedQuizQuestion, SharedQuizModuleCompanion, SharedQuizModule, SharedQuizOptionCompanion, SharedQuizOption, SharedQuizQuestionCompanion, SharedQuizSessionConfigurationCompanion, SharedQuizSessionConfiguration, SharedQuizSessionQuestionCompanion, SharedQuizSessionQuestion, SharedQuizSessionQuestionReferenceCompanion, SharedQuizSessionQuestionReference, SharedQuizSessionStateCompanion, SharedQuizSessionState, SharedStudyDifficultyCompanion, SharedStudyProgressCompanion, SharedStudyProgress, SharedKotlinRandom, SharedDuelEngineServiceCompanion, SharedDuelQuestionBankServiceCompanion, SharedQuestionDTO, SharedModuleDTOCompanion, SharedModuleDTO, SharedOptionDTOCompanion, SharedOptionDTO, SharedQuestionBankDTOCompanion, SharedQuestionBankDTO, SharedQuestionDTOCompanion, SharedQuizSessionResults, SharedAssetRegistry, SharedKotlinRandomDefault, SharedKotlinByteArray, SharedKotlinThrowable, SharedKotlinException, SharedKotlinRuntimeException, SharedKotlinIllegalStateException, SharedKotlinx_serialization_coreSerializersModule, SharedKotlinx_serialization_coreSerialKind, SharedKotlinNothing, SharedKotlinByteIterator;

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
@property (readonly) SharedDuelEngineService *duelEngineService __attribute__((swift_name("duelEngineService")));
@property (readonly) SharedDuelQuestionBankService *duelQuestionBankService __attribute__((swift_name("duelQuestionBankService")));
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
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AssetEntry")))
@interface SharedAssetEntry : SharedBase
- (instancetype)initWithId:(NSString *)id category:(NSString *)category path:(NSString *)path source_pack:(NSString * _Nullable)source_pack __attribute__((swift_name("init(id:category:path:source_pack:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedAssetEntryCompanion *companion __attribute__((swift_name("companion")));
- (SharedAssetEntry *)doCopyId:(NSString *)id category:(NSString *)category path:(NSString *)path source_pack:(NSString * _Nullable)source_pack __attribute__((swift_name("doCopy(id:category:path:source_pack:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *category __attribute__((swift_name("category")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) NSString *path __attribute__((swift_name("path")));
@property (readonly) NSString * _Nullable source_pack __attribute__((swift_name("source_pack")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AssetEntry.Companion")))
@interface SharedAssetEntryCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAssetEntryCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AssetRegistry")))
@interface SharedAssetRegistry : SharedBase
- (instancetype)initWithManifest:(SharedAssetsManifest *)manifest __attribute__((swift_name("init(manifest:)"))) __attribute__((objc_designated_initializer));
- (NSString *)pathId:(NSString *)id __attribute__((swift_name("path(id:)")));
- (NSString * _Nullable)tryPathId:(NSString *)id __attribute__((swift_name("tryPath(id:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AssetsManifest")))
@interface SharedAssetsManifest : SharedBase
- (instancetype)initWithVersion:(int32_t)version root:(NSString *)root assets:(NSArray<SharedAssetEntry *> *)assets __attribute__((swift_name("init(version:root:assets:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedAssetsManifestCompanion *companion __attribute__((swift_name("companion")));
- (SharedAssetsManifest *)doCopyVersion:(int32_t)version root:(NSString *)root assets:(NSArray<SharedAssetEntry *> *)assets __attribute__((swift_name("doCopy(version:root:assets:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSArray<SharedAssetEntry *> *assets __attribute__((swift_name("assets")));
@property (readonly) NSString *root __attribute__((swift_name("root")));
@property (readonly) int32_t version __attribute__((swift_name("version")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AssetsManifest.Companion")))
@interface SharedAssetsManifestCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAssetsManifestCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AnswerResult")))
@interface SharedAnswerResult : SharedBase
- (instancetype)initWithQuestionId:(NSString *)questionId playerAnswer:(BOOL)playerAnswer correctAnswer:(BOOL)correctAnswer isCorrect:(BOOL)isCorrect damageDealt:(int32_t)damageDealt damageTaken:(int32_t)damageTaken wasCrit:(BOOL)wasCrit streakMultiplier:(float)streakMultiplier __attribute__((swift_name("init(questionId:playerAnswer:correctAnswer:isCorrect:damageDealt:damageTaken:wasCrit:streakMultiplier:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedAnswerResultCompanion *companion __attribute__((swift_name("companion")));
- (SharedAnswerResult *)doCopyQuestionId:(NSString *)questionId playerAnswer:(BOOL)playerAnswer correctAnswer:(BOOL)correctAnswer isCorrect:(BOOL)isCorrect damageDealt:(int32_t)damageDealt damageTaken:(int32_t)damageTaken wasCrit:(BOOL)wasCrit streakMultiplier:(float)streakMultiplier __attribute__((swift_name("doCopy(questionId:playerAnswer:correctAnswer:isCorrect:damageDealt:damageTaken:wasCrit:streakMultiplier:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) BOOL correctAnswer __attribute__((swift_name("correctAnswer")));
@property (readonly) int32_t damageDealt __attribute__((swift_name("damageDealt")));
@property (readonly) int32_t damageTaken __attribute__((swift_name("damageTaken")));
@property (readonly) BOOL isCorrect __attribute__((swift_name("isCorrect")));
@property (readonly) BOOL playerAnswer __attribute__((swift_name("playerAnswer")));
@property (readonly) NSString *questionId __attribute__((swift_name("questionId")));
@property (readonly) float streakMultiplier __attribute__((swift_name("streakMultiplier")));
@property (readonly) BOOL wasCrit __attribute__((swift_name("wasCrit")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AnswerResult.Companion")))
@interface SharedAnswerResultCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedAnswerResultCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
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
__attribute__((swift_name("CompletedDuel")))
@interface SharedCompletedDuel : SharedBase
- (instancetype)initWithId:(NSString *)id enemyId:(NSString *)enemyId won:(BOOL)won xpEarned:(int64_t)xpEarned correctCount:(int32_t)correctCount totalQuestions:(int32_t)totalQuestions maxStreak:(int32_t)maxStreak completedAt:(int64_t)completedAt durationSeconds:(int64_t)durationSeconds __attribute__((swift_name("init(id:enemyId:won:xpEarned:correctCount:totalQuestions:maxStreak:completedAt:durationSeconds:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedCompletedDuelCompanion *companion __attribute__((swift_name("companion")));
- (SharedCompletedDuel *)doCopyId:(NSString *)id enemyId:(NSString *)enemyId won:(BOOL)won xpEarned:(int64_t)xpEarned correctCount:(int32_t)correctCount totalQuestions:(int32_t)totalQuestions maxStreak:(int32_t)maxStreak completedAt:(int64_t)completedAt durationSeconds:(int64_t)durationSeconds __attribute__((swift_name("doCopy(id:enemyId:won:xpEarned:correctCount:totalQuestions:maxStreak:completedAt:durationSeconds:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) int64_t completedAt __attribute__((swift_name("completedAt")));
@property (readonly) int32_t correctCount __attribute__((swift_name("correctCount")));
@property (readonly) int64_t durationSeconds __attribute__((swift_name("durationSeconds")));
@property (readonly) NSString *enemyId __attribute__((swift_name("enemyId")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) int32_t maxStreak __attribute__((swift_name("maxStreak")));
@property (readonly) int32_t totalQuestions __attribute__((swift_name("totalQuestions")));
@property (readonly) BOOL won __attribute__((swift_name("won")));
@property (readonly) int64_t xpEarned __attribute__((swift_name("xpEarned")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CompletedDuel.Companion")))
@interface SharedCompletedDuelCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedCompletedDuelCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelPersistenceData")))
@interface SharedDuelPersistenceData : SharedBase
- (instancetype)initWithPlayerProfile:(SharedPlayerProfile *)playerProfile recentDuels:(NSArray<SharedCompletedDuel *> *)recentDuels recentlySeenQuestionIds:(NSArray<NSString *> *)recentlySeenQuestionIds recentlyMissedQuestionIds:(NSArray<NSString *> *)recentlyMissedQuestionIds __attribute__((swift_name("init(playerProfile:recentDuels:recentlySeenQuestionIds:recentlyMissedQuestionIds:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedDuelPersistenceDataCompanion *companion __attribute__((swift_name("companion")));
- (SharedDuelPersistenceData *)doCopyPlayerProfile:(SharedPlayerProfile *)playerProfile recentDuels:(NSArray<SharedCompletedDuel *> *)recentDuels recentlySeenQuestionIds:(NSArray<NSString *> *)recentlySeenQuestionIds recentlyMissedQuestionIds:(NSArray<NSString *> *)recentlyMissedQuestionIds __attribute__((swift_name("doCopy(playerProfile:recentDuels:recentlySeenQuestionIds:recentlyMissedQuestionIds:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) SharedPlayerProfile *playerProfile __attribute__((swift_name("playerProfile")));
@property (readonly) NSArray<SharedCompletedDuel *> *recentDuels __attribute__((swift_name("recentDuels")));
@property (readonly) NSArray<NSString *> *recentlyMissedQuestionIds __attribute__((swift_name("recentlyMissedQuestionIds")));
@property (readonly) NSArray<NSString *> *recentlySeenQuestionIds __attribute__((swift_name("recentlySeenQuestionIds")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelPersistenceData.Companion")))
@interface SharedDuelPersistenceDataCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedDuelPersistenceDataCompanion *shared __attribute__((swift_name("shared")));
- (SharedDuelPersistenceData *)decodeJsonString:(NSString *)jsonString __attribute__((swift_name("decode(jsonString:)")));
- (NSString *)encodeData:(SharedDuelPersistenceData *)data __attribute__((swift_name("encode(data:)")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@property (readonly) SharedDuelPersistenceData *empty __attribute__((swift_name("empty")));
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
__attribute__((swift_name("DuelPhase")))
@interface SharedDuelPhase : SharedKotlinEnum<SharedDuelPhase *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) SharedDuelPhaseCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) SharedDuelPhase *intro __attribute__((swift_name("intro")));
@property (class, readonly) SharedDuelPhase *question __attribute__((swift_name("question")));
@property (class, readonly) SharedDuelPhase *feedback __attribute__((swift_name("feedback")));
@property (class, readonly) SharedDuelPhase *end __attribute__((swift_name("end")));
+ (SharedKotlinArray<SharedDuelPhase *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<SharedDuelPhase *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelPhase.Companion")))
@interface SharedDuelPhaseCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedDuelPhaseCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelQuestion")))
@interface SharedDuelQuestion : SharedBase
- (instancetype)initWithId:(NSString *)id topic:(NSString *)topic statement:(NSString *)statement answer:(BOOL)answer explanation:(NSString *)explanation source:(NSString *)source hint:(NSString *)hint __attribute__((swift_name("init(id:topic:statement:answer:explanation:source:hint:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedDuelQuestionCompanion *companion __attribute__((swift_name("companion")));
- (SharedDuelQuestion *)doCopyId:(NSString *)id topic:(NSString *)topic statement:(NSString *)statement answer:(BOOL)answer explanation:(NSString *)explanation source:(NSString *)source hint:(NSString *)hint __attribute__((swift_name("doCopy(id:topic:statement:answer:explanation:source:hint:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) BOOL answer __attribute__((swift_name("answer")));
@property (readonly) NSString *explanation __attribute__((swift_name("explanation")));
@property (readonly) NSString *hint __attribute__((swift_name("hint")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) NSString *source __attribute__((swift_name("source")));
@property (readonly) NSString *statement __attribute__((swift_name("statement")));
@property (readonly) NSString *topic __attribute__((swift_name("topic")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelQuestion.Companion")))
@interface SharedDuelQuestionCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedDuelQuestionCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelState")))
@interface SharedDuelState : SharedBase
- (instancetype)initWithId:(NSString *)id enemyId:(NSString *)enemyId enemyMaxHP:(int32_t)enemyMaxHP playerHP:(int32_t)playerHP enemyHP:(int32_t)enemyHP currentStreak:(int32_t)currentStreak maxStreak:(int32_t)maxStreak questionsAsked:(NSArray<NSString *> *)questionsAsked currentQuestion:(SharedDuelQuestion * _Nullable)currentQuestion phase:(SharedDuelPhase *)phase lifelines:(SharedLifelineState *)lifelines lastAnswer:(SharedAnswerResult * _Nullable)lastAnswer showingHint:(BOOL)showingHint startTime:(int64_t)startTime xpEarned:(int64_t)xpEarned correctCount:(int32_t)correctCount incorrectCount:(int32_t)incorrectCount __attribute__((swift_name("init(id:enemyId:enemyMaxHP:playerHP:enemyHP:currentStreak:maxStreak:questionsAsked:currentQuestion:phase:lifelines:lastAnswer:showingHint:startTime:xpEarned:correctCount:incorrectCount:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedDuelStateCompanion *companion __attribute__((swift_name("companion")));
- (SharedDuelState *)doCopyId:(NSString *)id enemyId:(NSString *)enemyId enemyMaxHP:(int32_t)enemyMaxHP playerHP:(int32_t)playerHP enemyHP:(int32_t)enemyHP currentStreak:(int32_t)currentStreak maxStreak:(int32_t)maxStreak questionsAsked:(NSArray<NSString *> *)questionsAsked currentQuestion:(SharedDuelQuestion * _Nullable)currentQuestion phase:(SharedDuelPhase *)phase lifelines:(SharedLifelineState *)lifelines lastAnswer:(SharedAnswerResult * _Nullable)lastAnswer showingHint:(BOOL)showingHint startTime:(int64_t)startTime xpEarned:(int64_t)xpEarned correctCount:(int32_t)correctCount incorrectCount:(int32_t)incorrectCount __attribute__((swift_name("doCopy(id:enemyId:enemyMaxHP:playerHP:enemyHP:currentStreak:maxStreak:questionsAsked:currentQuestion:phase:lifelines:lastAnswer:showingHint:startTime:xpEarned:correctCount:incorrectCount:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) int32_t correctCount __attribute__((swift_name("correctCount")));
@property (readonly) SharedDuelQuestion * _Nullable currentQuestion __attribute__((swift_name("currentQuestion")));
@property (readonly) int32_t currentStreak __attribute__((swift_name("currentStreak")));
@property (readonly) SharedEnemy * _Nullable enemy __attribute__((swift_name("enemy")));
@property (readonly) int32_t enemyHP __attribute__((swift_name("enemyHP")));
@property (readonly) NSString *enemyId __attribute__((swift_name("enemyId")));
@property (readonly) int32_t enemyMaxHP __attribute__((swift_name("enemyMaxHP")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) int32_t incorrectCount __attribute__((swift_name("incorrectCount")));
@property (readonly) BOOL isEnded __attribute__((swift_name("isEnded")));
@property (readonly) BOOL isPlayerDefeated __attribute__((swift_name("isPlayerDefeated")));
@property (readonly) BOOL isPlayerVictory __attribute__((swift_name("isPlayerVictory")));
@property (readonly) SharedAnswerResult * _Nullable lastAnswer __attribute__((swift_name("lastAnswer")));
@property (readonly) SharedLifelineState *lifelines __attribute__((swift_name("lifelines")));
@property (readonly) int32_t maxStreak __attribute__((swift_name("maxStreak")));
@property (readonly) SharedDuelPhase *phase __attribute__((swift_name("phase")));
@property (readonly) int32_t playerHP __attribute__((swift_name("playerHP")));
@property (readonly) NSArray<NSString *> *questionsAsked __attribute__((swift_name("questionsAsked")));
@property (readonly) BOOL showingHint __attribute__((swift_name("showingHint")));
@property (readonly) int64_t startTime __attribute__((swift_name("startTime")));
@property (readonly) int32_t totalAnswered __attribute__((swift_name("totalAnswered")));
@property (readonly) int64_t xpEarned __attribute__((swift_name("xpEarned")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelState.Companion")))
@interface SharedDuelStateCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedDuelStateCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Enemy")))
@interface SharedEnemy : SharedBase
- (BOOL)isUnlockedProfile:(SharedPlayerProfile *)profile __attribute__((swift_name("isUnlocked(profile:)")));
- (NSString * _Nullable)lockReasonProfile:(SharedPlayerProfile *)profile __attribute__((swift_name("lockReason(profile:)")));
@property (readonly) NSString *description_ __attribute__((swift_name("description_")));
@property (readonly) NSString *displayName __attribute__((swift_name("displayName")));
@property (readonly) NSString *iconName __attribute__((swift_name("iconName")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) int32_t maxHP __attribute__((swift_name("maxHP")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) NSString *themeColor __attribute__((swift_name("themeColor")));
@property (readonly) NSString *title __attribute__((swift_name("title")));
@property (readonly) NSArray<NSString *> *topicBiases __attribute__((swift_name("topicBiases")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("EnemyDefinitions")))
@interface SharedEnemyDefinitions : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)enemyDefinitions __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedEnemyDefinitions *shared __attribute__((swift_name("shared")));
- (SharedEnemy * _Nullable)enemyId:(NSString *)id __attribute__((swift_name("enemy(id:)")));
- (NSArray<SharedEnemy *> *)unlockedEnemiesProfile:(SharedPlayerProfile *)profile __attribute__((swift_name("unlockedEnemies(profile:)")));
@property (readonly) NSArray<SharedEnemy *> *allEnemies __attribute__((swift_name("allEnemies")));
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
__attribute__((swift_name("Lifeline")))
@interface SharedLifeline : SharedKotlinEnum<SharedLifeline *>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithName:(NSString *)name ordinal:(int32_t)ordinal __attribute__((swift_name("init(name:ordinal:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (class, readonly, getter=companion) SharedLifelineCompanion *companion __attribute__((swift_name("companion")));
@property (class, readonly) SharedLifeline *hint __attribute__((swift_name("hint")));
@property (class, readonly) SharedLifeline *shield __attribute__((swift_name("shield")));
@property (class, readonly) SharedLifeline *doubleTap __attribute__((swift_name("doubleTap")));
+ (SharedKotlinArray<SharedLifeline *> *)values __attribute__((swift_name("values()")));
@property (class, readonly) NSArray<SharedLifeline *> *entries __attribute__((swift_name("entries")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Lifeline.Companion")))
@interface SharedLifelineCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedLifelineCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializerTypeParamsSerializers:(SharedKotlinArray<id<SharedKotlinx_serialization_coreKSerializer>> *)typeParamsSerializers __attribute__((swift_name("serializer(typeParamsSerializers:)")));
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LifelineState")))
@interface SharedLifelineState : SharedBase
- (instancetype)initWithHintUsed:(BOOL)hintUsed shieldUsed:(BOOL)shieldUsed shieldActive:(BOOL)shieldActive doubleTapUsed:(BOOL)doubleTapUsed doubleTapActive:(BOOL)doubleTapActive __attribute__((swift_name("init(hintUsed:shieldUsed:shieldActive:doubleTapUsed:doubleTapActive:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedLifelineStateCompanion *companion __attribute__((swift_name("companion")));
- (SharedLifelineState *)doCopyHintUsed:(BOOL)hintUsed shieldUsed:(BOOL)shieldUsed shieldActive:(BOOL)shieldActive doubleTapUsed:(BOOL)doubleTapUsed doubleTapActive:(BOOL)doubleTapActive __attribute__((swift_name("doCopy(hintUsed:shieldUsed:shieldActive:doubleTapUsed:doubleTapActive:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) BOOL doubleTapActive __attribute__((swift_name("doubleTapActive")));
@property (readonly) BOOL doubleTapUsed __attribute__((swift_name("doubleTapUsed")));
@property (readonly) BOOL hintUsed __attribute__((swift_name("hintUsed")));
@property (readonly) int32_t remainingCount __attribute__((swift_name("remainingCount")));
@property (readonly) BOOL shieldActive __attribute__((swift_name("shieldActive")));
@property (readonly) BOOL shieldUsed __attribute__((swift_name("shieldUsed")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("LifelineState.Companion")))
@interface SharedLifelineStateCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedLifelineStateCompanion *shared __attribute__((swift_name("shared")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
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
__attribute__((swift_name("PlayerProfile")))
@interface SharedPlayerProfile : SharedBase
- (instancetype)initWithId:(NSString *)id xp:(int64_t)xp level:(int32_t)level duelsWon:(int32_t)duelsWon duelsLost:(int32_t)duelsLost totalCorrect:(int32_t)totalCorrect totalAnswered:(int32_t)totalAnswered longestStreak:(int32_t)longestStreak defeatedEnemies:(NSSet<NSString *> *)defeatedEnemies topicMastery:(NSDictionary<NSString *, SharedFloat *> *)topicMastery __attribute__((swift_name("init(id:xp:level:duelsWon:duelsLost:totalCorrect:totalAnswered:longestStreak:defeatedEnemies:topicMastery:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedPlayerProfileCompanion *companion __attribute__((swift_name("companion")));
- (SharedPlayerProfile *)doCopyId:(NSString *)id xp:(int64_t)xp level:(int32_t)level duelsWon:(int32_t)duelsWon duelsLost:(int32_t)duelsLost totalCorrect:(int32_t)totalCorrect totalAnswered:(int32_t)totalAnswered longestStreak:(int32_t)longestStreak defeatedEnemies:(NSSet<NSString *> *)defeatedEnemies topicMastery:(NSDictionary<NSString *, SharedFloat *> *)topicMastery __attribute__((swift_name("doCopy(id:xp:level:duelsWon:duelsLost:totalCorrect:totalAnswered:longestStreak:defeatedEnemies:topicMastery:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSSet<NSString *> *defeatedEnemies __attribute__((swift_name("defeatedEnemies")));
@property (readonly) int32_t duelsLost __attribute__((swift_name("duelsLost")));
@property (readonly) int32_t duelsWon __attribute__((swift_name("duelsWon")));
@property (readonly) NSString *id __attribute__((swift_name("id")));
@property (readonly) int32_t level __attribute__((swift_name("level")));
@property (readonly) float levelProgress __attribute__((swift_name("levelProgress")));
@property (readonly) int32_t longestStreak __attribute__((swift_name("longestStreak")));
@property (readonly) NSDictionary<NSString *, SharedFloat *> *topicMastery __attribute__((swift_name("topicMastery")));
@property (readonly) int32_t totalAnswered __attribute__((swift_name("totalAnswered")));
@property (readonly) int32_t totalCorrect __attribute__((swift_name("totalCorrect")));
@property (readonly) int64_t xp __attribute__((swift_name("xp")));
@property (readonly) int64_t xpToNextLevel __attribute__((swift_name("xpToNextLevel")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("PlayerProfile.Companion")))
@interface SharedPlayerProfileCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedPlayerProfileCompanion *shared __attribute__((swift_name("shared")));
- (int32_t)levelForXPXp:(int64_t)xp __attribute__((swift_name("levelForXP(xp:)")));
- (id<SharedKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
- (int64_t)xpForLevelLevel:(int32_t)level __attribute__((swift_name("xpForLevel(level:)")));
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
__attribute__((swift_name("DuelEngineService")))
@interface SharedDuelEngineService : SharedBase
- (instancetype)initWithQuestionBankService:(SharedDuelQuestionBankService *)questionBankService rng:(SharedKotlinRandom *)rng __attribute__((swift_name("init(questionBankService:rng:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedDuelEngineServiceCompanion *companion __attribute__((swift_name("companion")));
- (void)endDuel __attribute__((swift_name("endDuel()")));
- (SharedCompletedDuel * _Nullable)getCompletedDuel __attribute__((swift_name("getCompletedDuel()")));
- (void)proceedToNextQuestion __attribute__((swift_name("proceedToNextQuestion()")));
- (void)proceedToQuestion __attribute__((swift_name("proceedToQuestion()")));
- (NSArray<NSString *> *)recentlyMissedQuestionIds __attribute__((swift_name("recentlyMissedQuestionIds()")));
- (NSArray<NSString *> *)recentlySeenQuestionIds __attribute__((swift_name("recentlySeenQuestionIds()")));
- (void)setPlayerContextRecentSeen:(NSArray<NSString *> *)recentSeen recentMissed:(NSArray<NSString *> *)recentMissed weakTopics:(NSArray<NSString *> *)weakTopics __attribute__((swift_name("setPlayerContext(recentSeen:recentMissed:weakTopics:)")));
- (void)showFeedback __attribute__((swift_name("showFeedback()")));
- (SharedDuelState *)startDuelEnemy:(SharedEnemy *)enemy __attribute__((swift_name("startDuel(enemy:)")));
- (SharedAnswerResult * _Nullable)submitAnswerPlayerAnswer:(BOOL)playerAnswer __attribute__((swift_name("submitAnswer(playerAnswer:)")));
- (BOOL)useDoubleTap __attribute__((swift_name("useDoubleTap()")));
- (NSString * _Nullable)useHint __attribute__((swift_name("useHint()")));
- (BOOL)useShield __attribute__((swift_name("useShield()")));
@property (readonly) id<SharedKotlinx_coroutines_coreStateFlow> currentDuel __attribute__((swift_name("currentDuel")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelEngineService.Companion")))
@interface SharedDuelEngineServiceCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedDuelEngineServiceCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) float BASE_CRIT_CHANCE __attribute__((swift_name("BASE_CRIT_CHANCE")));
@property (readonly) int32_t BASE_DAMAGE __attribute__((swift_name("BASE_DAMAGE")));
@property (readonly) float CRIT_CHANCE_PER_STREAK __attribute__((swift_name("CRIT_CHANCE_PER_STREAK")));
@property (readonly) float CRIT_MULTIPLIER __attribute__((swift_name("CRIT_MULTIPLIER")));
@property (readonly) float DOUBLE_TAP_BONUS __attribute__((swift_name("DOUBLE_TAP_BONUS")));
@property (readonly) float MAX_CRIT_CHANCE __attribute__((swift_name("MAX_CRIT_CHANCE")));
@property (readonly) int32_t PLAYER_MAX_HP __attribute__((swift_name("PLAYER_MAX_HP")));
@property (readonly) float SHIELD_REDUCTION __attribute__((swift_name("SHIELD_REDUCTION")));
@property (readonly) int64_t XP_PER_CORRECT __attribute__((swift_name("XP_PER_CORRECT")));
@property (readonly) int64_t XP_STREAK_BONUS __attribute__((swift_name("XP_STREAK_BONUS")));
@property (readonly) int64_t XP_WIN_BONUS __attribute__((swift_name("XP_WIN_BONUS")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelQuestionBankService")))
@interface SharedDuelQuestionBankService : SharedBase
- (instancetype)initWithRng:(SharedKotlinRandom *)rng __attribute__((swift_name("init(rng:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) SharedDuelQuestionBankServiceCompanion *companion __attribute__((swift_name("companion")));
- (NSArray<SharedDuelQuestion *> *)allQuestions __attribute__((swift_name("allQuestions()")));
- (void)loadQuestionsJsonString:(NSString *)jsonString __attribute__((swift_name("loadQuestions(jsonString:)")));
- (SharedDuelQuestion * _Nullable)selectQuestionEnemy:(SharedEnemy *)enemy alreadySeen:(NSArray<NSString *> *)alreadySeen recentlySeen:(NSArray<NSString *> *)recentlySeen recentlyMissed:(NSArray<NSString *> *)recentlyMissed weakTopics:(NSArray<NSString *> *)weakTopics __attribute__((swift_name("selectQuestion(enemy:alreadySeen:recentlySeen:recentlyMissed:weakTopics:)")));
- (NSSet<NSString *> *)topics __attribute__((swift_name("topics()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelQuestionBankService.Companion")))
@interface SharedDuelQuestionBankServiceCompanion : SharedBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedDuelQuestionBankServiceCompanion *shared __attribute__((swift_name("shared")));
@property (readonly) float ENEMY_BIAS_WEIGHT __attribute__((swift_name("ENEMY_BIAS_WEIGHT")));
@property (readonly) int32_t GLOBAL_RECENT_BAN __attribute__((swift_name("GLOBAL_RECENT_BAN")));
@property (readonly) float MISSED_WEIGHT __attribute__((swift_name("MISSED_WEIGHT")));
@property (readonly) int32_t RELAXED_BAN __attribute__((swift_name("RELAXED_BAN")));
@property (readonly) float WEAKNESS_WEIGHT __attribute__((swift_name("WEAKNESS_WEIGHT")));
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

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("AssetRegistryKt")))
@interface SharedAssetRegistryKt : SharedBase
+ (SharedAssetRegistry *)loadAssetRegistry __attribute__((swift_name("loadAssetRegistry()")));
+ (SharedAssetRegistry * _Nullable)tryLoadAssetRegistry __attribute__((swift_name("tryLoadAssetRegistry()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DuelPersistenceKt")))
@interface SharedDuelPersistenceKt : SharedBase
+ (SharedPlayerProfile *)updateMasteryProfile:(SharedPlayerProfile *)profile topic:(NSString *)topic isCorrect:(BOOL)isCorrect __attribute__((swift_name("updateMastery(profile:topic:isCorrect:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TimeKt")))
@interface SharedTimeKt : SharedBase
+ (int64_t)currentTimeMillis __attribute__((swift_name("currentTimeMillis()")));
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


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.3")
*/
__attribute__((swift_name("KotlinRandom")))
@interface SharedKotlinRandom : SharedBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
@property (class, readonly, getter=companion) SharedKotlinRandomDefault *companion __attribute__((swift_name("companion")));
- (int32_t)nextBitsBitCount:(int32_t)bitCount __attribute__((swift_name("nextBits(bitCount:)")));
- (BOOL)nextBoolean __attribute__((swift_name("nextBoolean()")));
- (SharedKotlinByteArray *)nextBytesArray:(SharedKotlinByteArray *)array __attribute__((swift_name("nextBytes(array:)")));
- (SharedKotlinByteArray *)nextBytesSize:(int32_t)size __attribute__((swift_name("nextBytes(size:)")));
- (SharedKotlinByteArray *)nextBytesArray:(SharedKotlinByteArray *)array fromIndex:(int32_t)fromIndex toIndex:(int32_t)toIndex __attribute__((swift_name("nextBytes(array:fromIndex:toIndex:)")));
- (double)nextDouble __attribute__((swift_name("nextDouble()")));
- (double)nextDoubleUntil:(double)until __attribute__((swift_name("nextDouble(until:)")));
- (double)nextDoubleFrom:(double)from until:(double)until __attribute__((swift_name("nextDouble(from:until:)")));
- (float)nextFloat __attribute__((swift_name("nextFloat()")));
- (int32_t)nextInt __attribute__((swift_name("nextInt()")));
- (int32_t)nextIntUntil:(int32_t)until __attribute__((swift_name("nextInt(until:)")));
- (int32_t)nextIntFrom:(int32_t)from until:(int32_t)until __attribute__((swift_name("nextInt(from:until:)")));
- (int64_t)nextLong __attribute__((swift_name("nextLong()")));
- (int64_t)nextLongUntil:(int64_t)until __attribute__((swift_name("nextLong(until:)")));
- (int64_t)nextLongFrom:(int64_t)from until:(int64_t)until __attribute__((swift_name("nextLong(from:until:)")));
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

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinRandom.Default")))
@interface SharedKotlinRandomDefault : SharedKotlinRandom
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
+ (instancetype)default_ __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) SharedKotlinRandomDefault *shared __attribute__((swift_name("shared")));
- (int32_t)nextBitsBitCount:(int32_t)bitCount __attribute__((swift_name("nextBits(bitCount:)")));
- (BOOL)nextBoolean __attribute__((swift_name("nextBoolean()")));
- (SharedKotlinByteArray *)nextBytesArray:(SharedKotlinByteArray *)array __attribute__((swift_name("nextBytes(array:)")));
- (SharedKotlinByteArray *)nextBytesSize:(int32_t)size __attribute__((swift_name("nextBytes(size:)")));
- (SharedKotlinByteArray *)nextBytesArray:(SharedKotlinByteArray *)array fromIndex:(int32_t)fromIndex toIndex:(int32_t)toIndex __attribute__((swift_name("nextBytes(array:fromIndex:toIndex:)")));
- (double)nextDouble __attribute__((swift_name("nextDouble()")));
- (double)nextDoubleUntil:(double)until __attribute__((swift_name("nextDouble(until:)")));
- (double)nextDoubleFrom:(double)from until:(double)until __attribute__((swift_name("nextDouble(from:until:)")));
- (float)nextFloat __attribute__((swift_name("nextFloat()")));
- (int32_t)nextInt __attribute__((swift_name("nextInt()")));
- (int32_t)nextIntUntil:(int32_t)until __attribute__((swift_name("nextInt(until:)")));
- (int32_t)nextIntFrom:(int32_t)from until:(int32_t)until __attribute__((swift_name("nextInt(from:until:)")));
- (int64_t)nextLong __attribute__((swift_name("nextLong()")));
- (int64_t)nextLongUntil:(int64_t)until __attribute__((swift_name("nextLong(until:)")));
- (int64_t)nextLongFrom:(int64_t)from until:(int64_t)until __attribute__((swift_name("nextLong(from:until:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinByteArray")))
@interface SharedKotlinByteArray : SharedBase
+ (instancetype)arrayWithSize:(int32_t)size __attribute__((swift_name("init(size:)")));
+ (instancetype)arrayWithSize:(int32_t)size init:(SharedByte *(^)(SharedInt *))init __attribute__((swift_name("init(size:init:)")));
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (int8_t)getIndex:(int32_t)index __attribute__((swift_name("get(index:)")));
- (SharedKotlinByteIterator *)iterator __attribute__((swift_name("iterator()")));
- (void)setIndex:(int32_t)index value:(int8_t)value __attribute__((swift_name("set(index:value:)")));
@property (readonly) int32_t size __attribute__((swift_name("size")));
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

__attribute__((swift_name("KotlinByteIterator")))
@interface SharedKotlinByteIterator : SharedBase <SharedKotlinIterator>
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (SharedByte *)next __attribute__((swift_name("next()")));
- (int8_t)nextByte __attribute__((swift_name("nextByte()")));
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
