//
//  情报单位.h
//  谍战
//
//  Created by luyeeM on 2018/12/3.
//  Copyright © 2018 luyeeM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ActorMode) {
    ActorModeSend = 0x1000,
    ActorModeRecive
};

typedef NS_ENUM(NSInteger, BtnMode) {
    BtnModeGeneral = 1000,
    BtnModeSendKey,
    BtnModeEncode,
    BtnModeDecode,
    BtnModeSendMsg
};

@interface 情报单位 : UIView

@property (nonatomic, assign) ActorMode actorMode;

@property (nonatomic, weak) 情报单位 *otherSide;

@property (nonatomic, weak) IBOutlet UILabel *keyLab;

@property (nonatomic, weak) IBOutlet UITextField *secretTF;

@property (nonatomic, weak) IBOutlet UILabel *secretLab;

@property (nonatomic, weak) IBOutlet UIButton *optionBtn;

@property (nonatomic, weak) IBOutlet UIButton *sendBtn;

@property (nonatomic, weak) IBOutlet UILabel *actorLab;

@property (nonatomic, assign) NSInteger unitKey;

+ (instancetype)getInstance;

@end
