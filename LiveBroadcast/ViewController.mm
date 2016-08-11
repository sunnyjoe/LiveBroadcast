//
//  ViewController.m
//  LiveBroadcast
//
//  Created by Jiao on 10/8/16.
//  Copyright © 2016 Jiao. All rights reserved.
//

#import "ViewController.h"

static const int VIDEO_WIDTH = 1280;
static const int VIDEO_HEIGHT = 720;
static const int SAMPLE_RATE = 44100;

@interface ViewController ()
//@property(nonatomic) AVCaptureSession *session;
//@property(nonatomic) dispatch_queue_t videoQueue;
//@property(nonatomic) AVCaptureVideoDataOutput *videoOutput;
//@property(nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
//@property(nonatomic) AVCaptureConnection *videoConnection;
//@property(nonatomic) AVCaptureConnection *audioConnection;
//@property(nonatomic) AVEncoder *encoder;
//@property(nonatomic) HLSWriter *hlsWriter;
//@property(nonatomic) NSMutableData *videoSPSandPPS;
//@property(nonatomic) NSData *naluStartCode;
@end

@implementation ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    [self setupHLSWriter];
//    NSError *error = nil;
//    AVCaptureDevice *videoDevice;
//    for (AVCaptureDevice *device in [AVCaptureDevice devices]) {
//        if ([device hasMediaType:AVMediaTypeVideo] && device.position == AVCaptureDevicePositionBack) {
//            videoDevice = device;
//            break;
//        }
//    }
//    AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice error:&error];
//    if ([self.session canAddInput:videoInput]) {
//        [self.session addInput:videoInput];
//    }
//    
//    [self.videoOutput setSampleBufferDelegate:self queue:self.videoQueue];
//    if ([self.session canAddOutput:self.videoOutput]) {
//        [self.session addOutput:self.videoOutput];
//    }
//    
//    [self.encoder encodeWithBlock:^int(NSArray* dataArray, double pts) {
//        [self writeVideoFrames:dataArray pts:pts];
//        return 0;
//    } onParams:^int(NSData *data) {
//        return 0;
//    }];
//    
//    
//    [self.session startRunning];
//    self.videoConnection = [self.videoOutput connectionWithMediaType:AVMediaTypeVideo];
//    
//    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
//    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
//    [[self.previewLayer connection] setVideoOrientation:AVCaptureVideoOrientationPortrait];
//    
//    self.previewLayer.frame = self.view.layer.bounds;
//    [self.view.layer addSublayer:self.previewLayer];
//}
//
//
//- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection{
//    
//    if (connection == self.videoConnection) {  // Video
//        [self.encoder encodeFrame:sampleBuffer];
//    } else if (connection == self.audioConnection) {  // Audio
//        NSLog(@"这里获得audio sampleBuffer，做进一步处理（编码AAC）");
//    }
//}
//
//
//- (void) writeVideoFrames:(NSArray*)frames pts:(double)pts {
//    if (pts == 0) {
//        NSLog(@"PTS of 0, skipping frame");
//        return;
//    }
////    if (!_videoSPSandPPS) {
////        NSData* config = self.encoder.getConfigData;
////        
////        avcCHeader avcC((const BYTE*)[config bytes], [config length]);
////        SeqParamSet seqParams;
////        seqParams.Parse(avcC.sps());
////        
////        NSData* spsData = [NSData dataWithBytes:avcC.sps()->Start() length:avcC.sps()->Length()];
////        NSData *ppsData = [NSData dataWithBytes:avcC.pps()->Start() length:avcC.pps()->Length()];
////        
////        _videoSPSandPPS = [NSMutableData dataWithCapacity:avcC.sps()->Length() + avcC.pps()->Length() + _naluStartCode.length * 2];
////        [_videoSPSandPPS appendData:_naluStartCode];
////        [_videoSPSandPPS appendData:spsData];
////        [_videoSPSandPPS appendData:_naluStartCode];
////        [_videoSPSandPPS appendData:ppsData];
////    }
////    
//    for (NSData *data in frames) {
//        unsigned char* pNal = (unsigned char*)[data bytes];
//        //int idc = pNal[0] & 0x60;
//        int naltype = pNal[0] & 0x1f;
//        NSData *videoData = nil;
//        if (naltype == 5) { // IDR
//            NSMutableData *IDRData = [NSMutableData dataWithData:_videoSPSandPPS];
//            [IDRData appendData:_naluStartCode];
//            [IDRData appendData:data];
//            videoData = IDRData;
//        } else {
//            NSMutableData *regularData = [NSMutableData dataWithData:_naluStartCode];
//            [regularData appendData:data];
//            videoData = regularData;
//        }
//        [_hlsWriter processEncodedData:videoData presentationTimestamp:pts streamIndex:0];
//    }
//    
//}
//
//- (void) setupHLSWriter {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
//    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
//    NSString *folderName = [NSString stringWithFormat:@"%f.hls", time];
//    NSString *hlsDirectoryPath = [basePath stringByAppendingPathComponent:folderName];
//    [[NSFileManager defaultManager] createDirectoryAtPath:hlsDirectoryPath withIntermediateDirectories:YES attributes:nil error:nil];
//    self.hlsWriter = [[HLSWriter alloc] initWithDirectoryPath:hlsDirectoryPath];
//}
//
//-(AVCaptureSession *)session{
//    if (_session == nil) {
//        _session = [AVCaptureSession new];
//    }
//    return _session;
//}
//
//-(dispatch_queue_t)videoQueue{
//    if (_videoQueue == nil) {
//        _videoQueue = dispatch_queue_create("Video Capture Queue", DISPATCH_QUEUE_SERIAL);
//    }
//    return _videoQueue;
//}
//
//-(AVEncoder *)encoder{
//    if (_encoder == nil) {
//        _encoder = [AVEncoder encoderForHeight:VIDEO_HEIGHT andWidth:VIDEO_WIDTH];
//    }
//    return _encoder;
//}
//
//
//-(AVCaptureConnection *)videoConnection{
//    if (_videoConnection == nil) {
//        _videoConnection = [AVCaptureConnection new];
//    }
//    return _videoConnection;
//}
//
//-(AVCaptureVideoDataOutput *)videoOutput{
//    if (_videoOutput == nil) {
//        _videoOutput = [AVCaptureVideoDataOutput new];
//    }
//    return _videoOutput;
//}

@end
