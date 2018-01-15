//
//  AppDelegate.m
//  NotificationsHW
//
//  Created by Ivan Kozaderov on 12.01.2018.
//  Copyright © 2018 Ivan Kozaderov. All rights reserved.
//

#import "AppDelegate.h"
#import "KIGovernment.h"
#import "KIDoctor.h"
#import "KIPensioner.h"
#import "KIBusinessMan.h"
#import "KIAppDelegateClone.h"

@interface AppDelegate ()
@property(strong,nonatomic) KIGovernment* government;
@property(strong,nonatomic) KIDoctor* doctor;
@property(strong,nonatomic) KIPensioner* pensioner;
@property(strong,nonatomic) KIBusinessMan* businessMan;
@property(strong,nonatomic) KIAppDelegateClone* appDelegateClone;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.doctor      = [[KIDoctor alloc]init];
    self.pensioner   = [[KIPensioner alloc]init];
    self.businessMan = [[KIBusinessMan alloc]init];
    self.appDelegateClone = [[KIAppDelegateClone alloc]init];
    
    self.government = [[KIGovernment alloc]init];
    self.government.taxLevel      = 5.5;
    self.government.salary        = 1100;
    self.government.averagePrice  = 100;
    self.government.pension       = 550;
    
    self.doctor.salary            = self.government.salary;
    self.doctor.averagePrice      = self.government.averagePrice;
    

    self.pensioner.pension        = self.government.pension;
    self.pensioner.averagePrice   = self.government.averagePrice;
    
    self.businessMan.taxLevel     = self.government.taxLevel;
    self.businessMan.averagePrice = self.government.averagePrice;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:KIGovernmentTaxLevelDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:KIGovernmentSalaryDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:KIGovernmentAveragePriceDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                              selector:@selector(governmentNotification:)
                                                  name:KIGovernmentPensionDidChangeNotification
                                                object:nil];
    
    
    self.government.taxLevel     = 5.8;
    self.government.salary       = 1200;
    self.government.averagePrice = 104;
    self.government.pension      = 600;
    
    
    self.government.taxLevel     = 5.3;
    self.government.salary       = 1110;
    self.government.averagePrice = 101;
    self.government.pension      = 555;
    
    return YES;
}

-(void) dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
   
}

-(void) governmentNotification:(NSNotification*) notification{
    
 //   NSLog(@"government notification userInfo %@",notification.userInfo);
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:UIApplicationWillResignActiveNotification object:nil];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    


}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:UIApplicationWillEnterForegroundNotification object:nil];
    NSLog(@"WillEnterForegroundNotification original");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
 
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
