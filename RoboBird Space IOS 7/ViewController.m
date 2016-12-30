//
//  ViewController.m
//  RoboBird Space IOS 7
//
//  Created by JOSH AND SARI on 7/25/14.
//  Copyright (c) 2014 josue. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"
#import "MenuScene.h"
#import "GameData.h"
#import "GameKitHelper.h"
@implementation ViewController {
    GADBannerView *bannerView;
}
    

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    [self loadInter];

    self.items = [SKTextureAtlas atlasNamed:@"items"];
    self.shield = [SKTextureAtlas atlasNamed:@"shield"];
    self.images = [SKTextureAtlas atlasNamed:@"images"];
    
    NSArray *atlases = @[self.items, self.images,self.shield];
    [SKTextureAtlas preloadTextureAtlases:atlases withCompletionHandler:^{
        
        
        // Configure the view.
       }];
  
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showAuthenticationViewController) name:PresentAuthenticationViewController object:nil];
    [[GameKitHelper sharedGameKitHelper] authenticateLocalPlayer];
    
    SKView * skView = (SKView *)self.view;
    
    if (!skView.scene) {
        
        skView.showsFPS = NO;
        skView.showsNodeCount = NO;
        skView.showsPhysics = NO;
        // Create and configure the scene.
        SKScene * scene = [[MenuScene alloc] initWithSize:self.view.bounds.size volume:YES];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        
        
        // Present the scene.
        [skView presentScene:scene];
    
     
       
            }
   
    

}
-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    }

-(void)loadInter {
    if (!bannerView) {
    bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerLandscape origin:CGPointMake(0,288)];
    bannerView.adUnitID = @"ca-app-pub-8113403816143977/2473408043";
    bannerView.rootViewController = self;
        bannerView.delegate = self;
    GADRequest *request;
    [bannerView loadRequest:request];
     [self.view addSubview:bannerView];
    }
    
}

-(void)adViewWillPresentScreen:(GADBannerView *)adView {
    SKView *view = (SKView *)self.view;
    view.paused = YES;

}

-(void)adViewDidDismissScreen:(GADBannerView *)adView {
    SKView *view = (SKView *)self.view;
    view.paused = NO;

}

-(void)adViewWillLeaveApplication:(GADBannerView *)adView {
    SKView *view = (SKView *)self.view;
    view.paused = YES;

}




-(void)gameCenter {
    [[GameKitHelper sharedGameKitHelper] showGKGameCenterViewController:self];
    
}

- (void)showAuthenticationViewController {
    GameKitHelper *gameKitHelper = [GameKitHelper sharedGameKitHelper];
    [self presentViewController: gameKitHelper.authenticationViewController
                                         animated:YES completion:nil];
}

-(void)upgradeAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Buy the full version" message:@"remove ads" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/robobird-space/id908075815?l=es&ls=1&mt=8"]];
    }
}
-(void)awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shareButton) name:@"shareButton" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameCenter) name:@"gameCenter" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upgradeAlert) name:@"upgradeAlert" object:nil];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}




-(void)dealloc {
    bannerView.delegate = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)shareButton {
    NSArray *activityItems;

    NSURL * google = [NSURL URLWithString:@"https://itunes.apple.com/us/app/robobird-space-lite/id908385807?l=es&ls=1&mt=8"];
    NSString *text = [NSString stringWithFormat:@"Hey I just scored %li stars in this game! Try to beat me IF you can!", [GameData sharedGameData].score ];
    
    activityItems = @[google, text];
    
    UIActivityViewController *activityControler;
    if (!activityControler) {
        activityControler = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    }
    
    [self presentViewController:activityControler animated:YES completion:nil];

}
- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
