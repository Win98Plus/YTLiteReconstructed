//
// MobileFFmpegHeaders.h
// Extracted from YTLite.dylib (statically linked MobileFFmpeg classes 51..57)
//

#import <Foundation/Foundation.h>

@protocol LogDelegate <NSObject>
- (void)logCallback:(long)executionId :(int)level :(NSString *)message;
@end

@protocol StatisticsDelegate <NSObject>
- (void)statisticsCallback:(id)statistics;
@end

// Class [51] ArchDetect
@interface ArchDetect : NSObject
+ (void)initialize;
+ (id)getCpuArch;
+ (id)getArch;
+ (int)isLTSBuild;
@end

// Class [52] AtomicLong
@interface AtomicLong : NSObject
- (id)initWithInitialValue:(NSInteger)arg1;
- (NSInteger)incrementAndGet;
@end

// Class [53] FFmpegExecution
@interface FFmpegExecution : NSObject
- (id)initWithExecutionId:(NSInteger)arg1 andArguments:(id)arg2;
- (id)getStartTime;
- (NSInteger)getExecutionId;
- (id)getCommand;
@end

// Class [54] MobileFFmpeg
@interface MobileFFmpeg : NSObject
+ (void)initialize;
+ (int)executeWithId:(NSInteger)arg1 andArguments:(id)arg2;
+ (int)executeWithArguments:(id)arg1;
+ (int)executeWithArgumentsAsync:(id)arg1 withCallback:(id)arg2;
+ (int)executeWithArgumentsAsync:(id)arg1 withCallback:(id)arg2 andDispatchQueue:(id)arg3;
+ (int)execute:(id)arg1;
+ (int)executeAsync:(id)arg1 withCallback:(id)arg2;
+ (int)executeAsync:(id)arg1 withCallback:(id)arg2 andDispatchQueue:(id)arg3;
+ (int)execute:(id)arg1 delimiter:(id)arg2;
+ (void)cancel;
+ (void)cancel:(NSInteger)arg1;
+ (id)parseArguments:(id)arg1;
+ (id)argumentsToString:(id)arg1;
+ (id)listExecutions;
@end

// Class [55] CallbackData
@interface CallbackData : NSObject
- (id)initWithId:(NSInteger)arg1 logLevel:(int)arg2 data:(id)arg3;
- (id)initWithId:(NSInteger)arg1 videoFrameNumber:(int)arg2 fps:(float)arg3 quality:(float)arg4 size:(NSInteger)arg5 time:(int)arg6 bitrate:(double)arg7 speed:(double)arg8;
- (int)getType;
- (NSInteger)getExecutionId;
- (int)getLogLevel;
- (id)getLogData;
- (int)getStatisticsFrameNumber;
- (float)getStatisticsFps;
- (float)getStatisticsQuality;
- (NSInteger)getStatisticsSize;
- (int)getStatisticsTime;
- (double)getStatisticsBitrate;
- (double)getStatisticsSpeed;
@end

// Class [56] MobileFFmpegConfig
@interface MobileFFmpegConfig : NSObject
+ (void)initialize;
+ (void)enableRedirection;
+ (void)disableRedirection;
+ (int)getLogLevel;
+ (void)setLogLevel:(int)arg1;
+ (id)logLevelToString:(int)arg1;
+ (void)setLogDelegate:(id)arg1;
+ (void)setStatisticsDelegate:(id)arg1;
+ (id)getLastReceivedStatistics;
+ (void)resetStatistics;
+ (void)setFontconfigConfigurationPath:(id)arg1;
+ (void)setFontDirectory:(id)arg1 with:(id)arg2;
+ (id)getBuildConf;
+ (id)getPackageName;
+ (id)getExternalLibraries;
+ (id)registerNewFFmpegPipe;
+ (void)closeFFmpegPipe:(id)arg1;
+ (id)getFFmpegVersion;
+ (id)getVersion;
+ (id)getBuildDate;
+ (int)getLastReturnCode;
+ (id)getLastCommandOutput;
+ (void)ignoreSignal:(int)arg1;
@end

// Class [57] Statistics
@interface Statistics : NSObject
- (id)init;
- (id)initWithId:(NSInteger)arg1 videoFrameNumber:(int)arg2 fps:(float)arg3 quality:(float)arg4 size:(NSInteger)arg5 time:(int)arg6 bitrate:(double)arg7 speed:(double)arg8;
- (void)update:(id)arg1;
- (NSInteger)getExecutionId;
- (int)getVideoFrameNumber;
- (float)getVideoFps;
- (float)getVideoQuality;
- (NSInteger)getSize;
- (int)getTime;
- (double)getBitrate;
- (double)getSpeed;
@end

