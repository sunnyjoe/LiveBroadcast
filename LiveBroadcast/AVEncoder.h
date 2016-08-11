//
//  AVEncoder.h
//  LiveBroadcast
//
//  Created by Jiao on 10/8/16.
//  Copyright © 2016 Jiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVFoundation/AVAssetWriter.h"
#import "AVFoundation/AVAssetWriterInput.h"
#import "AVFoundation/AVMediaFormat.h"
#import "AVFoundation/AVVideoSettings.h"
#import "sys/stat.h"
#import "VideoEncoder.h"
#import "MP4Atom.h"
#import "NALUnit.h"

typedef int (^encoder_handler_t)(NSArray* data, double pts);
typedef int (^param_handler_t)(NSData* params);

@interface AVEncoder : NSObject

+ (AVEncoder*) encoderForHeight:(int) height andWidth:(int) width;

- (void) encodeWithBlock:(encoder_handler_t) block onParams: (param_handler_t) paramsHandler;
- (void) encodeFrame:(CMSampleBufferRef) sampleBuffer;
- (NSData*) getConfigData;
- (void) shutdown;


@property (readonly, atomic) int bitspersecond;

@end