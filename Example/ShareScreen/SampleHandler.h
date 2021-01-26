//
//  SampleHandler.h
//  ShareScreen
//
//  Created by ouyanggaojun on 2021/1/22.
//  Copyright © 2021 804716454@qq.com. All rights reserved.
//

#import <ReplayKit/ReplayKit.h>
#import <ChatFramework/DPSampleHandler.h>
@interface SampleHandler : RPBroadcastSampleHandler
@property (nonatomic) NSUserDefaults *sharedDefaults;
@property (nonatomic) unsigned long buffersize;
@property (nonatomic) uint8_t * mYuvbuffer;
@property (nonatomic) NSMutableData*data;


@end
