//
//  GameData.h
//  RoboBird Space IOS 7
//
//  Created by JOSH AND SARI on 7/29/14.
//  Copyright (c) 2014 josue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject <NSCoding>
@property (assign, nonatomic) long score;
@property (assign, nonatomic) long highScore;
+(instancetype)sharedGameData;
-(void)reset;
-(void)save;
@end
