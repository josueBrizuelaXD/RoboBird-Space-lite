//
//  Asteroid.h
//  RoboBird Space IOS 7
//
//  Created by JOSH AND SARI on 7/25/14.
//  Copyright (c) 2014 josue. All rights reserved.
//

#import "GameObject.h"

typedef NS_ENUM(int32_t, AsteroidType)
{
    
    AsteroidTypeMedium = 0,
    AsteroidTypeLarge,
    NumAsteroidTypes
};

@interface Asteroid : GameObject

- (instancetype)initWithAsteroidType:(AsteroidType)asteroidType;
@end
