//
//  KIPensioner.m
//  NotificationsHW
//
//  Created by Ivan Kozaderov on 14.01.2018.
//  Copyright © 2018 Ivan Kozaderov. All rights reserved.
//

#import "KIPensioner.h"
#import "KIGovernment.h"

@implementation KIPensioner

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSNotificationCenter*nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(pensionNotification:)
                   name:KIGovernmentPensionDidChangeNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(averagePriceNotification:)
                   name:KIGovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        self.averagePrice = 0.;
     
        [nc addObserver:self
               selector:@selector(WillResignActiveNotification:)
                   name:UIApplicationWillResignActiveNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(WillEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
    }
    return self;
}

-(void)pensionNotification:(NSNotification*) notification{
    
    CGFloat pension = [[notification.userInfo objectForKey:KIGovernmentPensionUserInfoKey] floatValue];
    
    if(pension > self.pension){
        
        NSLog(@"Pensioner is not happy");
        
    }
    
    self.pension = pension;
}

-(void)averagePriceNotification:(NSNotification*) notification{
    
    
    CGFloat averagePrice = [[notification.userInfo objectForKey:KIGovernmentAveragePriceUserInfoKey] floatValue];
    
    NSLog(@"averagePrice %f",averagePrice);
    
    if( averagePrice > self.averagePrice){
        
        NSLog(@"Pensioner is angry ");
        
        self.inflation = ((averagePrice - self.averagePrice) * 100) / self.averagePrice;
        
        if(self.inflation > 3.){
            
            NSLog(@"Pensioner is skreaming ");
            
        }
        
    }
    else {NSLog(@"Pensioner OK");
        
    }
    self.averagePrice = averagePrice;
    
}
-(void) dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)WillEnterForegroundNotification:(NSNotification*) notification{
    
    NSLog(@"Pensioner getting up");
    
}

-(void)WillResignActiveNotification:(NSNotification*) notification{
    
    NSLog(@"Pensioner going to sleep ");
    
}
@end
