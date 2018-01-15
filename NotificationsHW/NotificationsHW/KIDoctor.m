//
//  KIDoctor.m
//  NotificationsHW
//
//  Created by Ivan Kozaderov on 14.01.2018.
//  Copyright © 2018 Ivan Kozaderov. All rights reserved.
//

#import "KIDoctor.h"
#import "KIGovernment.h"


@implementation KIDoctor


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSNotificationCenter*nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(salaryNotification:)
                   name:KIGovernmentSalaryDidChangeNotification
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

-(void)salaryNotification:(NSNotification*) notification{
    
    
    
    CGFloat salary = [[notification.userInfo objectForKey:KIGovernmentSalaryUserInfoKey] floatValue];
    
    if(salary > self.salary){
        
     NSLog(@"Doctor is not happy");
        
    }
    
    self.salary = salary;
    
}

-(void)averagePriceNotification:(NSNotification*) notification{
    
 
    CGFloat averagePrice = [[notification.userInfo objectForKey:KIGovernmentAveragePriceUserInfoKey] floatValue];

    NSLog(@"averagePrice %f",averagePrice);
    
    if( averagePrice > self.averagePrice){
        
          NSLog(@"Doctor looking sadly ");
       
        self.inflation = ((averagePrice - self.averagePrice) * 100) / self.averagePrice;
        
        if(self.inflation > 5.){
            
          NSLog(@"Doctor is crying ");

        }
       
    }
    else {NSLog(@"Doctor OK");
          
    }
    self.averagePrice = averagePrice;
    
}

-(void) dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)WillEnterForegroundNotification:(NSNotification*) notification{
    
    NSLog(@"Doctor getting up");
    
}

-(void)WillResignActiveNotification:(NSNotification*) notification{
    
    NSLog(@"Doctor going to sleep ");
    
}
@end
