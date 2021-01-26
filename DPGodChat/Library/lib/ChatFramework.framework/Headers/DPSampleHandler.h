//
//  DPSampleHandler.h
//  ShareDeskTop
//
//  Created by 杜洁鹏 on 2020/12/4.
//  Copyright © 2020 easemob. All rights reserved.
//

#import <ReplayKit/ReplayKit.h>

@interface DPSampleHandler : RPBroadcastSampleHandler
@property (nonatomic) NSUserDefaults *sharedDefaults;
@property (nonatomic) unsigned long buffersize;
@property (nonatomic) uint8_t * mYuvbuffer;
@property (nonatomic) NSMutableData*data;


- (void)broadcastStartedWithSetupInfo:(NSDictionary<NSString *,NSObject *> *)setupInfo;

- (void)broadcastPaused;

- (void)broadcastResumed;

- (void)broadcastFinished;

- (void)processSampleBuffer:(CMSampleBufferRef)sampleBuffer withType:(RPSampleBufferType)sampleBufferType;

- (void)bufferToData:(CMSampleBufferRef)source;

@end
