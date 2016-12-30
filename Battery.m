//
//  Battery.m
//  RoboBird Space IOS 7
//
//  Created by JOSH AND SARI on 7/25/14.
//  Copyright (c) 2014 josue. All rights reserved.
//

#import "Battery.h"
#import "MyScene.h"
#import "SKTUtils.h"
@implementation Battery
-(instancetype)initWithImageNamed:(NSString *)name {
    if (self = [super initWithImageNamed:name]) {
        float rotateDuration = 4.0;
        [self configurePhysicBody];
        [self runAction:[SKAction repeatActionForever:[SKAction  rotateByAngle:DegreesToRadians(360) duration:rotateDuration]]];
        
    }
    return self;
}

-(void)configurePhysicBody {
    self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:(self.size.width )/2];
    self.physicsBody.affectedByGravity = NO;
    
    self.physicsBody.categoryBitMask = CollisionCategoryBatteryGreen;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = 0;
    
}

-(void)collidedWith:(SKPhysicsBody *)body contact:(SKPhysicsContact *)contact {
    [self destroy];
   __weak MyScene *scene = (MyScene *)self.scene;
    scene.powerActivated = YES;
    scene.powerButtonOn.hidden = NO;
    
    if (scene.volume == YES) {
        
        [self runAction:scene.battery];
    }
}

-(void)cleanup {
    [super cleanup];
    
}

-(void)update:(CFTimeInterval)dt {
    
}@end
