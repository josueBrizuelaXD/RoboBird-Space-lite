//
//  ViewController.h
//  RoboBird Space IOS 7
//

//  Copyright (c) 2014 josue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <Social/Social.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import  <iAd/iAd.h>
#import "GADBannerView.h"
#import "GADBannerViewDelegate.h"
@interface ViewController : UIViewController <UINavigationControllerDelegate, GADBannerViewDelegate, UIAlertViewDelegate>
@property (strong, nonatomic)   SKTextureAtlas *items;
@property (strong, nonatomic)  SKTextureAtlas *shield;
@property (strong, nonatomic) SKTextureAtlas *images;
-(void)shareButton;
@end
