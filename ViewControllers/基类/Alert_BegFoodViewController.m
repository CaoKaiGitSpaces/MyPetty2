//
//  Alert_BegFoodViewController.m
//  MyPetty
//
//  Created by miaocuilin on 14/12/11.
//  Copyright (c) 2014年 AidiGame. All rights reserved.
//

#import "Alert_BegFoodViewController.h"

@interface Alert_BegFoodViewController ()

@end

@implementation Alert_BegFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeUI];
}
-(void)makeUI
{
    //黑 %60  白 %80
    UIView * alphaView = [MyControl createViewWithFrame:[UIScreen mainScreen].bounds];
    alphaView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [self.view addSubview:alphaView];
    
    bgView = [MyControl createViewWithFrame:CGRectMake(18, ([UIScreen mainScreen].bounds.size.height-300)/2.0, [UIScreen mainScreen].bounds.size.width-36, 300)];
    [self.view addSubview:bgView];
    
    UIView * whiteBg = [MyControl createViewWithFrame:CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height)];
    whiteBg.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    whiteBg.layer.cornerRadius = 10;
    whiteBg.layer.masksToBounds = YES;
    [bgView addSubview:whiteBg];
    
    UIButton * closeBtn = [MyControl createButtonWithFrame:CGRectMake(bgView.frame.size.width-36, 0, 36, 36) ImageName:@"various_close.png" Target:self Action:@selector(closeBtnClick) Title:nil];
    [bgView addSubview:closeBtn];
    
    //
//    UILabel * name = [MyControl createLabelWithFrame:CGRectMake(258/2, 30, bgView.frame.size.width-258/2, 20) Font:14 Text:self.name];
//    name.textColor = ORANGE;
//    [bgView addSubview:name];
    UILabel * lab1 = [MyControl createLabelWithFrame:CGRectMake(258/2, 45, bgView.frame.size.width-258/2, 20) Font:15 Text:@"不在应用，也能赏粮！"];
    lab1.textColor = [ControllerManager colorWithHexString:@"7a7a7a"];
    [bgView addSubview:lab1];
    
    UILabel * lab2 = [MyControl createLabelWithFrame:CGRectMake(lab1.frame.origin.x, lab1.frame.origin.y+lab1.frame.size.height+5, bgView.frame.size.width-258/2, 20) Font:11 Text:@"每天都有免费打赏的机会哦~"];
    lab2.textColor = [ControllerManager colorWithHexString:@"7a7a7a"];
    [bgView addSubview:lab2];
    
    NSString * str3 = [NSString stringWithFormat:@"快分享给小伙伴，一起为%@助力！", self.name];
    CGSize size3 = [str3 sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(lab2.frame.size.width-10, 100) lineBreakMode:1];
    UILabel * lab3 = [MyControl createLabelWithFrame:CGRectMake(lab2.frame.origin.x, lab2.frame.origin.y+lab2.frame.size.height+20, bgView.frame.size.width-258/2-10, size3.height) Font:13 Text:nil];
    lab3.textColor = [ControllerManager colorWithHexString:@"7a7a7a"];
    [bgView addSubview:lab3];
    NSMutableAttributedString * mutableStr3 = [[NSMutableAttributedString alloc] initWithString:str3];
    [mutableStr3 addAttribute:NSForegroundColorAttributeName value:ORANGE range:NSMakeRange(11, self.name.length)];
    lab3.attributedText = mutableStr3;
    [mutableStr3 release];
    //
    bigImage = [MyControl createImageViewWithFrame:CGRectMake(8, 10, lab1.frame.origin.x-20, 160) ImageName:@""];
    bigImage.contentMode = UIViewContentModeScaleAspectFit;
    [bigImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", IMAGEURL, [self.dict objectForKey:@"url"]]]];
    [bgView addSubview:bigImage];
    
    //
    UIView * bgView1 = [MyControl createViewWithFrame:CGRectZero];
    [bgView addSubview:bgView1];
    
    NSString * str = @"已收到";
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(100, 20) lineBreakMode:1];
    UILabel * label1 = [MyControl createLabelWithFrame:CGRectMake(0, 0, size.width, 25) Font:15 Text:str];
    label1.textColor = ORANGE;
    [bgView1 addSubview:label1];
    
    UIImageView * foodImage = [MyControl createImageViewWithFrame:CGRectMake(label1.frame.origin.x+size.width, label1.frame.origin.y-6, 32, 32) ImageName:@"exchange_orangeFood"];
    [bgView1 addSubview:foodImage];
    
//    bgView.frame.size.height-214/2
    NSString * str1 = [self.dict objectForKey:@"food"];
    CGSize size1 = [str1 sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(100, 32) lineBreakMode:1];
    UILabel * foodNum = [MyControl createLabelWithFrame:CGRectMake(foodImage.frame.origin.x+foodImage.frame.size.width+5, 0, size1.width, 25) Font:17 Text:[self.dict objectForKey:@"food"]];
    foodNum.textColor = ORANGE;
    [bgView1 addSubview:foodNum];
    
    float w = foodNum.frame.origin.x+size1.width;
    bgView1.frame = CGRectMake((bgView.frame.size.width-w)/2.0, bgView.frame.size.height-234/2.0, w, 32);
    
//    float width = bgView.frame.size.width-label1.frame.origin.x-20;
//    NSString * str2 = @"今天也很努力地为自己挣口粮呢，分享给小伙伴，助TA一臂之力吧！";
//    CGSize size2 = [str2 sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(width, 100) lineBreakMode:1];
//    UILabel * label2 = [MyControl createLabelWithFrame:CGRectMake(label1.frame.origin.x, label1.frame.origin.y+label1.frame.size.height+15, width, size2.height) Font:13 Text:str2];
//    label2.textColor = [ControllerManager colorWithHexString:@"7a7a7a"];
//    [bgView addSubview:label2];
    
    NSArray * array = @[@"various_weChat.png", @"various_friendCircle", @"various_sina.png"];
    float spe = (bgView.frame.size.width-100-46*3)/2.0;
    for (int i=0; i<3; i++) {
        UIButton * button = [MyControl createButtonWithFrame:CGRectMake(50+(46+spe)*i, bgView.frame.size.height-70, 46, 46) ImageName:array[i] Target:self Action:@selector(shareClick:) Title:nil];
        button.tag = 1000+i;
        [bgView addSubview:button];
    }
    
//    deadLine = [MyControl createLabelWithFrame:CGRectMake(12, bgView.frame.size.height-50, bgView.frame.size.width-24, 15) Font:13 Text:nil];
//    deadLine.textColor = ORANGE;
//    [self time];
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(time) userInfo:nil repeats:YES];
//    [bgView addSubview:deadLine];
//    
//    UILabel * label3 = [MyControl createLabelWithFrame:CGRectMake(12, bgView.frame.size.height-30, bgView.frame.size.width-12, 15) Font:10 Text:@"每人每天都有免费赏粮机会快喊小伙伴一起打赏吧~"];
//    label3.textColor = ORANGE;
//    [bgView addSubview:label3];
}
//-(void)time
//{
//    deadLine.text = [NSString stringWithFormat:@"距离下一次发布还剩%@", [MyControl leftTimeFromStamp:[self.dict objectForKey:@"create_time"]]];
//    
//}
-(void)closeBtnClick
{
    [self.view removeFromSuperview];
}
-(void)shareClick:(UIButton *)sender
{
//    return;
//    int a = sender.tag-1000;
    //截图
//    UIImage * image = [MyControl imageWithView:bgView];
    
    /**************/
    if(sender.tag == 1000){
        NSLog(@"微信");
        //强制分享图片
        [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeWeb;
        [UMSocialData defaultData].extConfig.wechatSessionData.url = [NSString stringWithFormat:@"%@%@&to=%@", WEBBEGFOODAPI, [self.dict objectForKey:@"img_id"], @"wechat"];
        [UMSocialData defaultData].extConfig.wechatSessionData.title = @"轻轻一点，免费赏粮！我家宝贝的口粮就靠你啦~";
        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:@"努力卖萌，只为给自己代粮！快把你每天的免费粮食赏给我~" image:bigImage.image location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                NSLog(@"分享成功！");
//                [self loadShakeShare];
                [MyControl popAlertWithView:self.view Msg:@"分享成功"];
            }else{
                [MyControl popAlertWithView:self.view Msg:@"分享失败"];
            }
            
        }];
    }else if(sender.tag == 1001){
        NSLog(@"朋友圈");
        //强制分享图片
        [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeWeb;
        [UMSocialData defaultData].extConfig.wechatTimelineData.url = [NSString stringWithFormat:@"%@%@&to=%@", WEBBEGFOODAPI, [self.dict objectForKey:@"img_id"], @"wechat"];
        [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"轻轻一点，免费赏粮！我家宝贝的口粮就靠你啦~";
        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:nil image:bigImage.image location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
            if (response.responseCode == UMSResponseCodeSuccess) {
                NSLog(@"分享成功！");
                [MyControl popAlertWithView:[UIApplication sharedApplication].keyWindow Msg:@"分享成功"];
                //            StartLoading;
                //            [MMProgressHUD dismissWithSuccess:@"分享成功" title:nil afterDelay:0.5];
            }else{
                [MyControl popAlertWithView:[UIApplication sharedApplication].keyWindow Msg:@"分享失败"];
            }
            
        }];
        //
//        [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeImage;
//        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:nil image:image location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
//            
//            if (response.responseCode == UMSResponseCodeSuccess) {
//                NSLog(@"分享成功！");
////                [self loadShakeShare];
//                [MyControl popAlertWithView:self.view Msg:@"分享成功"];
//            }else{
//                [MyControl popAlertWithView:self.view Msg:@"分享失败"];
//            }
//            
//        }];
    }else if(sender.tag == 1002){
        NSLog(@"微博");
        NSString * str = [NSString stringWithFormat:@"轻轻一点，免费赏粮！快把你每天的免费粮食赏给我家%@！#挣口粮#%@（分享自@宠物星球社交应用）", self.name, [NSString stringWithFormat:@"%@%@&to=%@", WEBBEGFOODAPI, [self.dict objectForKey:@"img_id"], @"weibo"]];
        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToSina] content:str image:bigImage.image location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                NSLog(@"分享成功！");
//                [self loadShakeShare];
                [MyControl popAlertWithView:self.view Msg:@"分享成功"];
            }else{
                NSLog(@"失败原因：%@", response);
                [MyControl popAlertWithView:self.view Msg:@"分享失败"];
            }
            
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
