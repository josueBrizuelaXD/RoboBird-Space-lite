//
//  GameKitHelper.h
//  RoboBird Space
//
//  Created by JOSH AND SARI on 8/10/14.
//  Copyright (c) 2014 josue. All rights reserved.
//

#import <Foundation/Foundation.h>

@import GameKit;

extern NSString *const PresentAuthenticationViewController;
@interface GameKitHelper : NSObject 

@property (nonatomic, readonly) UIViewController *authenticationViewController;
@property (nonatomic, readonly) NSError *lastError;

+ (instancetype)sharedGameKitHelper;

- (void)authenticateLocalPlayer;
- (void)reportScore:(int64_t)score forLeaderboardID:(NSString*)leaderboardID;
- (void)showGKGameCenterViewController: (UIViewController *)viewController;
@end
