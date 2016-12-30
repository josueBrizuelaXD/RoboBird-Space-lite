//
//  MyScene.h
//  RoboBird Space IOS 7
//

//  Copyright (c) 2014 josue. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <Chartboost/Chartboost.h>
#import <Chartboost/CBNewsfeed.h>
#import "AppDelegate.h"
#import <CommonCrypto/CommonDigest.h>
#import <AdSupport/AdSupport.h>
@import AVFoundation;

@interface MyScene : SKScene <ChartboostDelegate, CBNewsfeedDelegate>
@property (strong, nonatomic)SKLabelNode *starLabel;
@property (strong, nonatomic)SKLabelNode *scoreLabel;
@property (strong, nonatomic)SKLabelNode *distanceLabel;
@property (strong, nonatomic) SKSpriteNode *shareButton;
@property (nonatomic, strong)  SKSpriteNode *powerButtonOn;
@property BOOL powerActivated;
@property BOOL shieldActivated;
@property BOOL volume;
@property BOOL startBgMoving;
@property BOOL gameOver;
@property (strong, nonatomic) NSMutableArray *shieldOnFrames;
@property (strong, nonatomic) SKSpriteNode *shield;
@property (strong, nonatomic) SKAction *explosionAsteroid;
@property (strong, nonatomic) SKAction *specialStar;
@property (strong, nonatomic) SKAction *battery;
@property (strong, nonatomic) SKAction *star;
@property (strong, nonatomic) SKAction *starEffect;
@property (strong, nonatomic) SKSpriteNode *asteroidOver;
@property (strong, nonatomic) SKSpriteNode *playButtonPauseMenu;
@property (strong, nonatomic) SKLabelNode *pauseLabel;
@property (strong, nonatomic) SKSpriteNode *pauseButton;
@property (strong, nonatomic) SKSpriteNode *menuButton;
@property (strong, nonatomic) AVAudioPlayer *backgroundAudioPlayer;
@property (strong, nonatomic) SKSpriteNode *starLabelImage;
 -(instancetype)initWithSize:(CGSize)size volume:(BOOL)volume;
@end
