//
//  ViewController.m
//  LiveBroadcast
//
//  Created by Jiao on 10/8/16.
//  Copyright © 2016 Jiao. All rights reserved.
//

#import "ViewController.h"
#import "Kickflip.h"
#import "KFAPIClient.h"
#import <MediaPlayer/MediaPlayer.h>

#define KickFlip_API_Key @"--t53VDu!fxKKZ?iYtOHsI4B4ubw_Aponwo7fbH6"
#define KickFlip_API_Secret @"pVqO3go5bV9kcDBpxw!Okv.uTrwC5smO:vjXH?Smb28E5R-:QP7YIHFn!gA1ifswi31E_YARtFBM5ryzz0zZ=p8VwI5b3WSE40L4xYNyUMUKTeEvdS1cCav9EyjBfLGF"



@interface ViewController ()

@end

@implementation ViewController{
    BOOL hasAppeard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Kickflip setupWithAPIKey:KickFlip_API_Key secret:KickFlip_API_Secret];
    
    [[KFAPIClient sharedClient] loginExistingUserWithUsername:@"JiaoQing" password:@"lovejiaoqing" callbackBlock:^(KFUser *existingUser, NSError *error) {
        if (existingUser) {
            NSLog(@"successfully logged in existing user");
        }
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (hasAppeard) {
        return;
    }
    hasAppeard = true;
    
    [Kickflip presentBroadcasterFromViewController:self ready:^(KFStream *stream) {
        if (stream.streamURL) {
            NSLog(@"Stream is ready at URL: %@", stream.streamURL);
        }
    } completion:^(BOOL success, NSError* error){
        if (!success) {
            NSLog(@"Error setting up stream: %@", error);
        } else {
            NSLog(@"Done broadcasting");
        }
    }];

//    return;
//    [[KFAPIClient sharedClient] requestStreamsByKeyword:nil pageNumber:1 itemsPerPage:10 callbackBlock:^(NSArray *streams, KFPaginationInfo *paginationInfo, NSError *error) {
//        for (KFStream *one in streams) {
//            if (one.isLive) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    MPMoviePlayerViewController *movieView = [[MPMoviePlayerViewController alloc] initWithContentURL:one.streamURL];
//                    [self presentViewController:movieView animated:YES completion:nil];
//                });
//                break;
//            }
//        }
//    }];
}

@end
