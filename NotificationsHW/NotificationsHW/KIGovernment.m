//
//  KIGovernment.m
//  NotificationsHW
//
//  Created by Ivan Kozaderov on 12.01.2018.
//  Copyright © 2018 Ivan Kozaderov. All rights reserved.
//

#import "KIGovernment.h"

NSString* const KIGovernmentTaxLevelDidChangeNotification      = @"KIGovernmentTaxLevelDidChangeNotification";
NSString* const KIGovernmentSalaryDidChangeNotification        = @"KIGovernmentSalaryDidChangeNotification";
NSString* const KIGovernmentAveragePriceDidChangeNotification  = @"KIGovernmentAveragePriceDidChangeNotification";
NSString* const KIGovernmentPensionDidChangeNotification       = @"KIGovernmentPensionDidChangeNotification";

NSString* const KIGovernmentTaxLevelUserInfoKey                = @"KIGovernmentTaxLevelUserInfoKey";
NSString* const KIGovernmentSalaryUserInfoKey                  = @"KIGovernmentSalaryUserInfoKey";
NSString* const KIGovernmentAveragePriceUserInfoKey            = @"KIGovernmentAveragePriceUserInfoKey";
NSString* const KIGovernmentPensionUserInfoKey                 = @"KIGovernmentPensionUserInfoKey";

NSString* const  UIApplicationDidFinishLaunchingNotification    = @"UIApplicationDidFinishLaunchingNotification";
NSString* const  UIApplicationWillResignActiveNotification      = @"UIApplicationWillResignActiveNotification";
NSString* const  UIApplicationDidEnterBackgroundNotification    = @"UIApplicationDidEnterBackgroundNotification";
NSString* const  UIApplicationWillEnterForegroundNotification   = @"UIApplicationWillEnterForegroundNotification";
NSString* const  UIApplicationDidBecomeActiveNotification       = @"UIApplicationDidBecomeActiveNotification";
NSString* const  UIApplicationWillTerminateNotification         = @"UIApplicationWillTerminateNotification";

@implementation KIGovernment



-(void) setTaxLevel:(CGFloat)taxLevel{
    
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:KIGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KIGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                        userInfo:dictionary];
   
}

-(void) setSalary:(CGFloat)salary{
    
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:KIGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KIGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

-(void) setAveragePrice:(CGFloat)averagePrice{
    
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:KIGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KIGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

-(void) setPension:(CGFloat)pension{
    
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:KIGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KIGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}
@end
