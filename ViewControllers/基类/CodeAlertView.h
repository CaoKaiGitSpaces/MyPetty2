//
//  CodeAlertView.h
//  MyPetty
//
//  Created by miaocuilin on 14/11/12.
//  Copyright (c) 2014年 AidiGame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyStarModel.h"
#import "InviteCodeModel.h"
@interface CodeAlertView : UIView <UITextFieldDelegate>
{
    UILabel * lab1;
    UILabel * lab2;
    
    UITextField * tf;

}
//@property(nonatomic,copy)

@property(nonatomic,retain)MyStarModel * model;
@property(nonatomic,retain)InviteCodeModel * codeModel;
@property(nonatomic,retain)UIImageView * bgImageView;
@property(nonatomic,retain)UIButton * closeBtn;
@property(nonatomic,retain)UIButton * confirmBtn;
@property(nonatomic,retain)UIView * alphaView;

@property(nonatomic,retain)UIImageView * headImage;
//先判断本地inviter值是否为字符串，是就填写过了，直接跳已经填写过了，并且请求
//填写过的人的infoApi

//1.填写邀请码(无头像) 2.填写成功(宠物头像) 3.已经填写过(宠物头像)  4.显示邀请码(宠物头像)
@property(nonatomic)int alertType;
@property(nonatomic,copy)void (^confirmClick)(NSString *);
@property(nonatomic,copy)void (^shareClick)(int,UIImage *,NSString *);
-(void)makeUI;

-(void)closeBtnClick;
@end
