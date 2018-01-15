//
//  KiBusinessMan.m
//  NotificationsHW
//
//  Created by Ivan Kozaderov on 14.01.2018.
//  Copyright © 2018 Ivan Kozaderov. All rights reserved.
//

#import "KIBusinessMan.h"
#import "KIGovernment.h"



@implementation KIBusinessMan

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSNotificationCenter*nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(taxLevelNotification:)
                   name:KIGovernmentTaxLevelDidChangeNotification
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

-(void)taxLevelNotification:(NSNotification*) notification{
    
    CGFloat taxLevel = [[notification.userInfo objectForKey:KIGovernmentPensionUserInfoKey] floatValue];
    
    if(taxLevel > self.taxLevel){
        
        NSLog(@"Businessman is not happy");
        
    }
    
    self.taxLevel = taxLevel;
}

-(void)averagePriceNotification:(NSNotification*) notification{
  
    
    CGFloat averagePrice = [[notification.userInfo objectForKey:KIGovernmentAveragePriceUserInfoKey] floatValue];
    
    NSLog(@"averagePrice %f",averagePrice);
    
    if( averagePrice > self.averagePrice){
        
        NSLog(@"Businessman is lauthing ");
        
        self.inflation = ((averagePrice - self.averagePrice) * 100) / self.averagePrice;
        
        if(self.inflation > 6.){
            
            NSLog(@"Businessman strictly talking ");
            
        }
        
    }
    else {NSLog(@"Businessman OK");
        
    }
    self.averagePrice = averagePrice;
    
}

-(void) dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)WillEnterForegroundNotification:(NSNotification*) notification{
    
    NSLog(@"Businessman getting up");
    
}

-(void)WillResignActiveNotification:(NSNotification*) notification{
    
    NSLog(@"Businessman going to sleep ");
    
}
@end
