//
//  ViewController.m
//  谍战
//
//  Created by luyeeM on 2018/12/3.
//  Copyright © 2018 luyeeM. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger, ActorMode) {
    ActorModeSend = 0x1000,
    ActorModeRecive
};

typedef NS_ENUM(NSInteger, BtnMode) {
    BtnModeGeneral = 1000,
    BtnModeSend,
    BtnModeSecret
};


@interface 中央情报局 : UIView

@property (nonatomic, assign) ActorMode actorMode;

@property (nonatomic, weak) 中央情报局 *otherSide;

@property (nonatomic, weak) IBOutlet UILabel *keyLab;

@property (nonatomic, weak) IBOutlet UITextField *secretTF;

@property (nonatomic, weak) IBOutlet UILabel *secretLab;

@end

@implementation 中央情报局

- (void)setActorMode:(ActorMode)actorMode{
    _actorMode = actorMode;
    switch(_actorMode){
        case ActorModeSend:{
            
        }
            break;
        case ActorModeRecive:{
            
        }
            break;
        default:{
            
        }
            break;
    }
}

- (IBAction)btnClicked:(UIButton *)btn{
    switch(btn.tag){
        case BtnModeGeneral:{
            [self generatalUnitKey];
        }
            break;
        case BtnModeSend:{
            self.otherSide.keyLab.text = self.otherSide.keyLab.text.length
            ?
            [NSNumber numberWithInteger:
             self.otherSide.keyLab.text.integerValue * self.keyLab.text.integerValue
             ].stringValue
            :
            self.keyLab.text;
        }
            break;
        case BtnModeSecret:{
            [self en_deCode];
        }
            break;
        default:{
            
        }
            break;
    }
}

- (void)generatalUnitKey{
    self.keyLab.text = [NSNumber numberWithInt:arc4random()%100].stringValue;
}

- (void)en_deCode{
    if(self.actorMode == ActorModeSend){
        self.secretLab.text = self.otherSide.secretTF.text = [NSNumber numberWithInteger:self.secretTF.text.integerValue * self.keyLab.text.integerValue].stringValue;
    }else{
        self.secretLab.text =  [NSNumber numberWithInteger:self.secretTF.text.integerValue / self.keyLab.text.integerValue].stringValue;
    }
}

@end


@interface ViewController ()

@property (nonatomic, strong) 中央情报局 *CIA;

@property (nonatomic, strong) 中央情报局 *CIC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.CIA = 中央情报局.new;
    self.CIC = 中央情报局.new;
    
}


@end
