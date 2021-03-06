//
//  ChoseLoadViewController.m
//  MyPetty
//
//  Created by miaocuilin on 14-8-1.
//  Copyright (c) 2014年 AidiGame. All rights reserved.
//

#import "ChoseLoadViewController.h"
#import "ChooseInViewController.h"
//#import "DropitBehavior.h"
@interface ChoseLoadViewController ()
{
//    DropitBehavior * behavior;
//    DropitBehavior * behavior2;
//    UIDynamicAnimator * animator;
}
@end

@implementation ChoseLoadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [self createUI];
//    
//    timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(cloudMove) userInfo:nil repeats:YES];
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [UIApplication sharedApplication].statusBarHidden = NO;
    
//    behavior = [[DropitBehavior alloc] init];
//    behavior2 = [[DropitBehavior alloc] init];
//    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
//    [animator addBehavior:behavior];
//    [animator addBehavior:behavior2];
    
    [self createUI];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(cloudMove) userInfo:nil repeats:YES];
}

-(void)createUI
{
    UIView * statusView = [MyControl createViewWithFrame:CGRectMake(0, 0, 320, 20)];
    statusView.backgroundColor = BGCOLOR;
    [self.view addSubview:statusView];
    
    UIImageView * earth = [MyControl createImageViewWithFrame:CGRectMake(0, 20, 382/2, 187/2) ImageName:@"1-a.png"];
    [self.view addSubview:earth];
    
    cloud0 = [MyControl createImageViewWithFrame:CGRectMake(-22, self.view.frame.size.height-750/2, 87/2, 60/2) ImageName:@"1-g.png"];
    [self.view addSubview:cloud0];
    /*************喵星**************/
//    UIView * miLine = [MyControl createViewWithFrame:CGRectMake(30, 20, 5, 0)];
//    miLine.backgroundColor = BGCOLOR;
//    [self.view addSubview:miLine];
    
    miBgView = [MyControl createViewWithFrame:CGRectMake(30, self.view.frame.size.height-300, 100, 105+50)];
    [self.view addSubview:miBgView];
//    [behavior addItem:miBgView];
//    [behavior.collider setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(-155, 0, 380/2-50, 0)];
    
    UIView * miBg1 = [MyControl createViewWithFrame:CGRectMake(0, 5, 100, 100)];
    miBg1.backgroundColor = BGCOLOR;
    miBg1.layer.cornerRadius = miBg1.frame.size.height/2;
    miBg1.layer.masksToBounds = YES;
    [miBgView addSubview:miBg1];
    
    UIView * miBg2 = [MyControl createViewWithFrame:CGRectMake(0, 0, 100, 100)];
    miBg2.backgroundColor = BGCOLOR3;
    miBg2.layer.cornerRadius = miBg2.frame.size.height/2;
    miBg2.layer.masksToBounds = YES;
    [miBgView addSubview:miBg2];
    
    UIImageView * mi = [MyControl createImageViewWithFrame:CGRectMake(5, 12, 90, 153/2) ImageName:@"1-d.png"];
    [miBg2 addSubview:mi];
    
    UIButton * miBtn = [MyControl createButtonWithFrame:CGRectMake(0, 0, miBg2.frame.size.width, miBg2.frame.size.height) ImageName:@"" Target:self Action:@selector(miBtnClick) Title:nil];
    [miBg2 addSubview:miBtn];
    
    UILabel * miDes = [MyControl createLabelWithFrame:CGRectMake(-10, miBg1.frame.origin.y+miBg1.frame.size.height+5, 140, 50) Font:15 Text:@"   MI星球(喵星球)\n距离地球一百亿光年"];
    miDes.textColor = [UIColor colorWithRed:50/255.0 green:138/255.0 blue:197/255.0 alpha:1];
    miDes.font = [UIFont boldSystemFontOfSize:15];
    miDes.alpha = 0;
    [miBgView addSubview:miDes];

    //动画效果
    [UIView animateWithDuration:1 delay:0.7 options:0 animations:^{
//        miLine.frame = CGRectMake(30, 20, 5, self.view.frame.size.height-(380/2+50)-20);
    } completion:^(BOOL finished) {
//        [animator removeBehavior:behavior];
//        [behavior removeItem:miBgView];
        [UIView animateWithDuration:0.5 animations:^{
            miDes.alpha = 1;
        }];
    }];
    
    /*************汪星**************/
    
//    UIView * waLine = [MyControl createViewWithFrame:CGRectMake(180, 20, 5, 0)];
//    waLine.backgroundColor = BGCOLOR;
//    [self.view addSubview:waLine];
    
    waBgView = [MyControl createViewWithFrame:CGRectMake(180, self.view.frame.size.height-870/2, 100, 105+50)];
//    waBgView.frame = CGRectMake(180, -155, 100, 155);
    [self.view addSubview:waBgView];
//    [behavior2 addItem:waBgView];
//    [behavior2.collider setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(-155, 0, 650/2-55, 0)];
    
    UIView * waBg1 = [MyControl createViewWithFrame:CGRectMake(0, 5, 100, 100)];
    waBg1.backgroundColor = BGCOLOR;
    waBg1.layer.cornerRadius = waBg1.frame.size.height/2;
    waBg1.layer.masksToBounds = YES;
    [waBgView addSubview:waBg1];
    
    UIView * waBg2 = [MyControl createViewWithFrame:CGRectMake(0, 0, 100, 100)];
    waBg2.backgroundColor = BGCOLOR3;
    waBg2.layer.cornerRadius = waBg2.frame.size.height/2;
    waBg2.layer.masksToBounds = YES;
    [waBgView addSubview:waBg2];
    
    UIImageView * wa = [MyControl createImageViewWithFrame:CGRectMake(5, 12, 90, 153/2) ImageName:@"1-e.png"];
    [waBg2 addSubview:wa];
    
    UIButton * waBtn = [MyControl createButtonWithFrame:CGRectMake(0, 0, waBg2.frame.size.width, waBg2.frame.size.height) ImageName:@"" Target:self Action:@selector(waBtnClick) Title:nil];
    [waBg2 addSubview:waBtn];
    
    UILabel * waDes = [MyControl createLabelWithFrame:CGRectMake(-15, 105, 140, 50) Font:15 Text:@"   WA星球(汪星球)\n距离地球九十亿光年"];
    waDes.textColor = [UIColor colorWithRed:50/255.0 green:138/255.0 blue:197/255.0 alpha:1];
    waDes.font = [UIFont boldSystemFontOfSize:15];
    waDes.alpha = 0;
    [waBgView addSubview:waDes];
    
//    [UIView animateWithDuration:0.5 animations:^{
//        waLine.frame = CGRectMake(180, 20, 5, waBg1.frame.origin.y+50-20);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1 animations:^{
//            waDes.alpha = 1;
//        }];
//    }];
    [UIView animateWithDuration:0.5 delay:0.7 options:0 animations:^{
//        waLine.frame = CGRectMake(180, 20, 5, self.view.frame.size.height-(860/2-55)-20);
    } completion:^(BOOL finished) {
//        [animator removeBehavior:behavior2];
//        [behavior2 removeItem:waBgView];
        [UIView animateWithDuration:0.5 animations:^{
            waDes.alpha = 1;
        }];
    }];
    /**************************/
    
    cloud = [MyControl createImageViewWithFrame:CGRectMake(470/2, self.view.frame.size.height-280/2, 87/2, 60/2) ImageName:@"1-g.png"];
    [self.view addSubview:cloud];
    
    UIImageView * grass = [MyControl createImageViewWithFrame:CGRectMake(0, self.view.frame.size.height-76/2, 320, 76/2) ImageName:@"1-f.png"];
    [self.view addSubview:grass];
    
    UIImageView * tips = [MyControl createImageViewWithFrame:CGRectMake(230/2, self.view.frame.size.height-215/2, 281/2, 205/2) ImageName:@"1-c.png"];
    [self.view addSubview:tips];
    
    UILabel * line1 = [MyControl createLabelWithFrame:CGRectMake(30, 5, 100, 20) Font:17 Text:@"选 择 您 想"];
    line1.font = [UIFont boldSystemFontOfSize:17];
    line1.textColor = [UIColor colorWithRed:255/255.0 green:250/255.0 blue:180/255.0 alpha:1];
    [tips addSubview:line1];
    
    UILabel * line2 = [MyControl createLabelWithFrame:CGRectMake(20, 30, 180, 20) Font:17 Text:@"登 陆 的 星 球"];
    line2.font = [UIFont boldSystemFontOfSize:17];
    line2.textColor = [UIColor colorWithRed:255/255.0 green:250/255.0 blue:180/255.0 alpha:1];
    [tips addSubview:line2];
    
    
}

-(void)cloudMove
{
    count++;
    if (count/50 == 5) {
        count = 0;
        CABasicAnimation * shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        //抖动幅度
        shake.fromValue = [NSNumber numberWithFloat:-0.1];
        shake.toValue = [NSNumber numberWithFloat:0.1];
        shake.duration = 0.1;
        shake.autoreverses = YES; //是否重复
        shake.repeatCount = 2;
        [miBgView.layer addAnimation:shake forKey:@"view"];
        [waBgView.layer addAnimation:shake forKey:@"view"];
    }
    cloud0.frame = CGRectMake(cloud0.frame.origin.x+0.5, cloud0.frame.origin.y, cloud0.frame.size.width, cloud0.frame.size.height);
    cloud.frame = CGRectMake(cloud.frame.origin.x+0.5, cloud.frame.origin.y, cloud.frame.size.width, cloud.frame.size.height);
    if (cloud.frame.origin.x == 320) {
        cloud.frame = CGRectMake(-cloud.frame.size.width, cloud.frame.origin.y, cloud.frame.size.width, cloud.frame.size.height);
    }
    if (cloud0.frame.origin.x == 320) {
        cloud0.frame = CGRectMake(-cloud0.frame.size.width, cloud0.frame.origin.y, cloud0.frame.size.width, cloud0.frame.size.height);
    }
}
-(void)miBtnClick
{
    NSLog(@"进入喵星");
    ChooseInViewController * vc = [[ChooseInViewController alloc] init];
    vc.isMi = YES;
    [self presentViewController:vc animated:YES completion:nil];
    [timer invalidate];
    timer = nil;
    [vc release];
}
-(void)waBtnClick
{
    NSLog(@"进入汪星");
    ChooseInViewController * vc = [[ChooseInViewController alloc] init];
    vc.isMi = NO;
    [self presentViewController:vc animated:YES completion:nil];
    [timer invalidate];
    timer = nil;
    [vc release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
