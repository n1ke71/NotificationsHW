//
//  KIAppDelegateClone.m
//  NotificationsHW
//
//  Created by Ivan Kozaderov on 15.01.2018.
//  Copyright © 2018 Ivan Kozaderov. All rights reserved.
//

#import "KIAppDelegateClone.h"
#import "KIGovernment.h"


@implementation KIAppDelegateClone


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(DidFinishLaunchingNotification:)
                   name:UIApplicationDidFinishLaunchingNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(WillResignActiveNotification:)
                   name:UIApplicationWillResignActiveNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(DidEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(WillEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(DidBecomeActiveNotification:)
                   name:UIApplicationDidBecomeActiveNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(WillTerminateNotification:)
                   name:UIApplicationWillTerminateNotification
                 object:nil];
    }
    return self;
}

#pragma mark - Notifications

-(void)DidFinishLaunchingNotification:(NSNotification*) notification{
    
    NSLog(@"DidFinishLaunchingNotification");
    
}
-(void)WillResignActiveNotification:(NSNotification*) notification{
    
    NSLog(@"WillResignActiveNotification");
    
}
-(void)DidEnterBackgroundNotification:(NSNotification*) notification{
    
    NSLog(@"DidEnterBackgroundNotification");
    
}

-(void)WillEnterForegroundNotification:(NSNotification*) notification{
    
    NSLog(@"WillEnterForegroundNotification clone");
    
}
-(void)DidBecomeActiveNotification:(NSNotification*) notification{
    
    NSLog(@"DidBecomeActiveNotification");
    
}
-(void)WillTerminateNotification:(NSNotification*) notification{
    
    NSLog(@"WillTerminateNotification");
    
}
@end
