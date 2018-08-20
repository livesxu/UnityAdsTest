//
//  ViewController.m
//  RACTest
//
//  Created by livesxu on 2018/8/14.
//  Copyright © 2018年 Livesxu. All rights reserved.
//

#import "ViewController.h"

#import <UnityAds/UnityAds.h>

@interface ViewController ()<UnityAdsDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [UnityAds initialize:@"2666578" delegate:self testMode:NO];
    [UnityAds setDebugMode:true];
    
}

- (void)buttonAction {
    
    if ([UnityAds isReady:@"lianchevideo"]) {
        
        [UnityAds show:self placementId:@"lianchevideo"];
    } else {
        
        NSLog(@"广告还未准备好");
    }
}

- (void)unityAdsReady:(NSString *)placementId;{
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message;{
    
}

- (void)unityAdsDidStart:(NSString *)placementId;{
    
}

- (void)unityAdsDidFinish:(NSString *)placementId
          withFinishState:(UnityAdsFinishState)state;{
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
}


@end

