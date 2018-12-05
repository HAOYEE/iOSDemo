//
//  情报单位.m
//  谍战
//
//  Created by luyeeM on 2018/12/3.
//  Copyright © 2018 luyeeM. All rights reserved.
//

#import "情报单位.h"

@implementation 情报单位

+ (instancetype)getInstance{
    return [[NSBundle mainBundle] loadNibNamed:@"情报单位" owner:self options:nil].lastObject;
}

- (void)setActorMode:(ActorMode)actorMode{
    _actorMode = actorMode;
    if(_actorMode == ActorModeRecive){
        self.sendBtn.hidden = YES;
        self.optionBtn.tag = BtnModeDecode;
        [self.optionBtn setTitle:@"解密" forState:UIControlStateNormal];
        self.actorLab.text = @"接收方";
        self.secretTF.placeholder = @"嘘~有绝密情报正在路上";
    }
}

- (IBAction)btnClicked:(UIButton *)btn{
    switch(btn.tag){
        case BtnModeGeneral:{
            [self generatalUnitKey];
        }
            break;
        case BtnModeSendKey:{
            [self sendKey];
        }
            break;
        case BtnModeEncode:{
            [self encode];
        }
            break;
        case BtnModeDecode:{
            [self decode];
        }
            break;
        case BtnModeSendMsg:{
            [self sendMsg];
        }
        default:{
            
        }
            break;
    }
}

- (void)generatalUnitKey{
    self.unitKey = arc4random()%100;
    self.unitKey = self.unitKey ? self.unitKey : 1;
    self.keyLab.text = [NSNumber numberWithInteger:self.unitKey].stringValue;
}

- (void)sendKey{
    self.otherSide.keyLab.text = [NSNumber numberWithInteger:self.unitKey * self.otherSide.unitKey].stringValue;
}

- (void)encode{
    self.secretLab.text = [NSNumber numberWithInteger:self.secretTF.text.integerValue * self.keyLab.text.integerValue].stringValue;
}

- (void)decode{
    self.secretLab.text = [NSNumber numberWithInteger:self.secretTF.text.integerValue / self.keyLab.text.integerValue].stringValue;
}

- (void)sendMsg{
    self.otherSide.secretTF.text = self.secretLab.text;
}



@end
