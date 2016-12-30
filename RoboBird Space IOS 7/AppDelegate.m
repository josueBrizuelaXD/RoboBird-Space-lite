//
//  AppDelegate.m
//  RoboBird Space IOS 7
//
//  Created by JOSH AND SARI on 7/25/14.
//  Copyright (c) 2014 josue. All rights reserved.
//

#import "AppDelegate.h"
#import <SpriteKit/SpriteKit.h>
#import "MyScene.h"
#import "MenuScene.h"
#import "GameData.h"
#import <Chartboost/Chartboost.h>
#import <Chartboost/CBNewsfeed.h>
#import "AppDelegate.h"
#import <CommonCrypto/CommonDigest.h>
#import <AdSupport/AdSupport.h>
@interface AppDelegate () <ChartboostDelegate, CBNewsfeedDelegate>
@end
@implementation AppDelegate {
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [Chartboost startWithAppId:@"53e90ecb89b0bb1df0818d5c"
                  appSignature:@"5b859f396f7c1e31003bb60d58ab01c072d20604"
                      delegate:self];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    SKView *view = (SKView *)self.window.rootViewController.view;
    view.paused = YES;
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    SKView *view = (SKView *)self.window.rootViewController.view;
    view.paused = YES;
    
    

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
       
    
    SKView *view = (SKView *)self.window.rootViewController.view;
    view.paused = NO;
    
    
    
    
}

-(BOOL)shouldRequestInterstitialsInFirstSession {
    return NO;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    
    SKView *view = (SKView *)self.window.rootViewController.view;
    view.paused = NO;
    
   
    
   
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
