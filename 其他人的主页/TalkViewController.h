//
//  TalkViewController.h
//  MyPetty
//
//  Created by Aidi on 14-7-14.
//  Copyright (c) 2014年 AidiGame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
@interface TalkViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView * tv;
    UITextField * tf;
    UIButton * sendButton;
    
    UIView * commentBgView;
    
    ASIFormDataRequest * _request;
    ASIFormDataRequest * _requestSend;
    UIView * navView;

}
@property (nonatomic,retain)NSMutableArray * dataArray;
@property (nonatomic,retain)NSMutableArray * userDataArray;
@end
