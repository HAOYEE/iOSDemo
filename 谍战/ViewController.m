//
//  ViewController.m
//  谍战
//
//  Created by luyeeM on 2018/12/3.
//  Copyright © 2018 luyeeM. All rights reserved.
//

#import "ViewController.h"
#import "情报单位.h"


@interface ViewController ()

@property (nonatomic, strong) 情报单位 *CIA;

@property (nonatomic, strong) 情报单位 *CIC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.CIA = 情报单位.getInstance;
    self.CIC = 情报单位.getInstance;
    
    self.CIA.actorMode = ActorModeSend;
    self.CIC.actorMode = ActorModeRecive;
    
    self.CIA.otherSide = self.CIC;
    self.CIC.otherSide = self.CIA;
    
    [self.view addSubview:self.CIA];
    [self.view addSubview:self.CIC];
    
    CGRect frame = self.view.bounds;
    frame.size.height /= 2.3;
    self.CIA.frame = frame;
    frame.origin.y = self.view.bounds.size.height - frame.size.height;
    self.CIC.frame = frame;
    
}


@end
