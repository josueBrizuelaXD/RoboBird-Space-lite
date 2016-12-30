//
//  MenuScene.m
//  RoboBird Space IOS 7
//
//  Created by JOSH AND SARI on 7/25/14.
//  Copyright (c) 2014 josue. All rights reserved.
//

#import "MenuScene.h"
#import "MyScene.h"
#import "GameData.h"
#import "InstructionsScene.h"

@implementation MenuScene {
    SKSpriteNode *bg;
    MyScene *scene;
    SKTransition *trans;
    SKSpriteNode *play;
    SKSpriteNode *_soundOnButton;
    SKSpriteNode *_soundOffButton;
    BOOL _volume;
    NSString *bgName;
    SKSpriteNode *_menuStar;
    SKLabelNode *_starLabel;
    SKSpriteNode *_helpButton;
    SKAction *playButton;
    SKSpriteNode *_gameCenterButton;
    SKSpriteNode *_fb;
    SKSpriteNode *_twitter;
     SKSpriteNode *_upgradeButton;
    
}
-(instancetype)initWithSize:(CGSize)size volume:(BOOL)volume {
    if (self = [super initWithSize:size]) {
        _volume = volume;
        if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && ([[UIScreen mainScreen]bounds].size.width == 480)) {
            
              bg = [SKSpriteNode spriteNodeWithImageNamed:@"menuRoboBird4"];
        } else {
                 bg = [SKSpriteNode spriteNodeWithImageNamed:@"menuRoboBird"];
            
        }
        
       
        bg.position = CGPointMake(0, 0);
        bg.anchorPoint = CGPointZero;
        [self addChild:bg];
        
        [Chartboost startWithAppId:@"53e90ecb89b0bb1df0818d5c" appSignature:@"5b859f396f7c1e31003bb60d58ab01c072d20604" delegate:self];
        
        
        
        [Chartboost cacheInterstitial:CBLocationGameOver];
            play = [SKSpriteNode spriteNodeWithImageNamed:@"playButton"];
            play.name = @"playButton";
            play.position = CGPointMake(self.size.width - 150 , 150);
            [self addChild:play];
            
            
            _soundOnButton = [SKSpriteNode spriteNodeWithImageNamed:@"soundButton"];
            _soundOnButton.position = CGPointMake(self.size.width - 30, self.size.height - 165);
            [self addChild:_soundOnButton];
            
            _soundOffButton = [SKSpriteNode spriteNodeWithImageNamed:@"muteButton"];
            _soundOffButton.position = CGPointMake(self.size.width - 30,  self.size.height - 165);
            _soundOffButton.zPosition = 100;
            _soundOffButton.hidden = YES;
            [self addChild:_soundOffButton];
            
            trans = [SKTransition flipVerticalWithDuration:0.5];
        
      
        //starLabel
        _menuStar = [SKSpriteNode spriteNodeWithImageNamed:@"StarMenu"];
        _menuStar.position = CGPointMake(30, self.size.height - 20);
        _menuStar.zPosition = 100;
        _menuStar.hidden = YES;
        [self addChild:_menuStar];
        
        _starLabel = [SKLabelNode labelNodeWithFontNamed:@"Starjedi"];
        _starLabel.position = CGPointMake(85, self.size.height - 30);
        _starLabel.zPosition = 100;
        _starLabel.fontSize = 20;
        _starLabel.hidden = YES;
        _starLabel.fontColor = [UIColor yellowColor];
        _starLabel.text = [NSString stringWithFormat:@" x %li", [GameData sharedGameData].highScore];
        [self addChild:_starLabel];
        
        _gameCenterButton = [SKSpriteNode spriteNodeWithImageNamed:@"leaderBoardButton"];
        _gameCenterButton.position =  CGPointMake(self.size.width - 30, self.size.height - 30);
        [self addChild:_gameCenterButton];
        
        _helpButton = [SKSpriteNode spriteNodeWithImageNamed:@"helpButton"];
        _helpButton.position =  CGPointMake(self.size.width - 30, self.size.height - 100);
        [self addChild:_helpButton];
        
        _fb = [SKSpriteNode spriteNodeWithImageNamed:@"FbLogo"];
        _fb.position = CGPointMake(self.size.width - 30,  self.size.height - 220);
        [self addChild:_fb];
        
        _twitter = [SKSpriteNode spriteNodeWithImageNamed:@"twitterLogo"];
        _twitter.position = CGPointMake(self.size.width - 30, 50);
        [self addChild:_twitter];
        
        
        _upgradeButton = [SKSpriteNode spriteNodeWithImageNamed:@"upgradeButton"];
        _upgradeButton.position = CGPointMake(30, self.size.height - 70);
        [self addChild:_upgradeButton];
        
        playButton = [SKAction playSoundFileNamed:@"button_press.wav" waitForCompletion:NO];
    }
    return self;
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    if ([play containsPoint:location]) {
        
        scene = [[MyScene alloc] initWithSize:self.size volume:_volume];
        trans.pausesIncomingScene = NO;
        [self.view presentScene:scene transition:trans];
        if (_volume==YES) {
            [self runAction:playButton];
        }
    }
    if ([_soundOnButton containsPoint:location] && _volume == YES) {
        _soundOffButton.hidden = NO;
        _volume = NO;
        [self runAction:playButton];
    } else if ([_soundOnButton containsPoint:location] && _volume ==NO) {
        _volume = YES;
        _soundOffButton.hidden = YES;
    }
    
    if ([_helpButton containsPoint:location]) {
        
        if (_volume == YES) {
            [self runAction:playButton];
        }
        InstructionsScene *insScene = [[InstructionsScene alloc] initWithSize:self.size volume:_volume];
        trans.pausesIncomingScene = NO;
        [self.view presentScene:insScene transition:trans];
    }
    
    if ([_upgradeButton containsPoint:location]) {
        
        if (_volume == YES) {
            [self runAction:playButton];
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"upgradeAlert" object:self];
    }
    
    if ([_gameCenterButton containsPoint:location]) {
        if (_volume == YES) {
            [self runAction:playButton];
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"gameCenter" object:self];
    }
    
    if ([_fb containsPoint:location]) {
        if (_volume == YES) {
            [self runAction:playButton];
        }
        
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://facebook.com/robobirdspace"]];
        
    }
    
    if ([_twitter containsPoint:location]) {
        if (_volume == YES) {
             [self runAction:playButton];
        }
        
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/RoboBirdSpace"]];
        
    }
    
}


-(void)update:(NSTimeInterval)currentTime {
    if (_volume == YES) {
        _soundOffButton.hidden = YES;
    } else {
        _soundOffButton.hidden = NO;
    }
    
    if ([GameData sharedGameData].highScore > 0) {
        _menuStar.hidden = NO;
        _starLabel.hidden = NO;
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

@end
