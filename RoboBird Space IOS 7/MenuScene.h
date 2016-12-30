//
//  MenuScene.h
//  RoboBird Space IOS 7
//
//  Created by JOSH AND SARI on 7/25/14.
//  Copyright (c) 2014 josue. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <Chartboost/Chartboost.h>
#import <Chartboost/CBNewsfeed.h>
#import "AppDelegate.h"
#import <CommonCrypto/CommonDigest.h>
#import <AdSupport/AdSupport.h>
@interface MenuScene : SKScene <ChartboostDelegate, CBNewsfeedDelegate>
-(instancetype)initWithSize:(CGSize)size volume:(BOOL)volume;@end
