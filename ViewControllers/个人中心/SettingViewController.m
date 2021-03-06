//
//  SettingViewController.m
//  MyPetty
//
//  Created by miaocuilin on 14-8-18.
//  Copyright (c) 2014年 AidiGame. All rights reserved.
//

#import "SettingViewController.h"
#import "AddressViewController.h"
#import "FeedbackViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arr1 = @[@"资料修改", @"收货地址", @"绑定新浪微博"];
    self.arr2 = @[@"新浪微博", @"微信朋友圈"];
    self.arr3 = @[@"清除缓存", @"检查更新", @"常见问题", @"意见反馈", @"赏个好评", @"关于我们"];
    
    [self createBg];
    [self createTableView];
    [self createFakeNavigation];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [tv flashScrollIndicators];
}
-(void)createBg
{
    self.bgImageView = [MyControl createImageViewWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) ImageName:@""];
    [self.view addSubview:self.bgImageView];
    //    self.bgImageView.backgroundColor = [UIColor redColor];
    NSString * docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * filePath = [docDir stringByAppendingPathComponent:[NSString stringWithFormat:@"blurBg.png"]];
    NSLog(@"%@", filePath);
    NSData * data = [NSData dataWithContentsOfFile:filePath];
    //    NSLog(@"%@", data);
    UIImage * image = [UIImage imageWithData:data];
    self.bgImageView.image = image;
    //    self.bgImageView.image = [UIImage imageNamed:@"Default-568h@2x.png"];
    
    //毛玻璃化，需要先设置图片再设置其他
//    [self.bgImageView setFramesCount:20];
//    [self.bgImageView setBlurAmount:1];
    
    //这里必须延时执行，否则会变白
    //注意，由于图片较大，这里需要的时间必须在2秒以上
//    [self performSelector:@selector(blurImage) withObject:nil afterDelay:0.25f];
    UIView * tempView = [MyControl createViewWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    tempView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.75];
    [self.view addSubview:tempView];
}
#pragma mark - 图片毛玻璃化
//-(void)blurImage
//{
//    [self.bgImageView blurInAnimationWithDuration:0.1f];
//}
-(void)createTableView
{
    tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    tv.dataSource = self;
    tv.delegate = self;
    tv.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tv];
    
    UIView * tempView = [MyControl createViewWithFrame:CGRectMake(0, 0, 320, 64)];
    tv.tableHeaderView = tempView;
}
-(void)createFakeNavigation
{
    navView = [MyControl createViewWithFrame:CGRectMake(0, 0, 320, 64)];
    [self.view addSubview:navView];
    
    UIView * alphaView = [MyControl createViewWithFrame:CGRectMake(0, 0, 320, 64)];
    alphaView.alpha = 0.85;
    alphaView.backgroundColor = BGCOLOR;
    [navView addSubview:alphaView];
    
    UIImageView * backImageView = [MyControl createImageViewWithFrame:CGRectMake(17, 30, 20, 20) ImageName:@"7-7.png"];
    [navView addSubview:backImageView];
    
    UIButton * backBtn = [MyControl createButtonWithFrame:CGRectMake(10, 25, 40, 30) ImageName:@"" Target:self Action:@selector(backBtnClick:) Title:nil];
    backBtn.showsTouchWhenHighlighted = YES;
    [navView addSubview:backBtn];
    
    UILabel * titleLabel = [MyControl createLabelWithFrame:CGRectMake(60, 64-20-15, 200, 20) Font:17 Text:@"设置"];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:titleLabel];
}
-(void)backBtnClick:(UIButton *)button
{
    button.selected = !button.selected;
    JDSideMenu * menu = [ControllerManager shareJDSideMenu];
    if (button.selected) {
        [menu showMenuAnimated:YES];
    }else{
        [menu hideMenuAnimated:YES];
    }
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else if(section == 1){
        return 2;
    }else{
        return 6;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString * cellID = @"ID";
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            sinaBind = [[UISwitch alloc] initWithFrame:CGRectMake(500/2, 7, 0, 0)];
            [sinaBind addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:sinaBind];
        }
        cell.textLabel.text =[NSString stringWithFormat:@"     %@",self.arr1[indexPath.row]];
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            sina = [[UISwitch alloc] initWithFrame:CGRectMake(500/2, 7, 0, 0)];
            sina.on = YES;
            [sina addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:sina];
        }else{
            weChat = [[UISwitch alloc] initWithFrame:CGRectMake(500/2, 7, 0, 0)];
            weChat.on = YES;
            [weChat addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:weChat];
        }
        
        cell.textLabel.text =[NSString stringWithFormat:@"     %@",self.arr2[indexPath.row]];
    }else{
        if (indexPath.row == 0) {
            cacheLabel = [MyControl createLabelWithFrame:CGRectMake(320-100-20, 10, 100, 20) Font:15 Text:nil];
            [cell addSubview:cacheLabel];

        }
        cell.textLabel.text =[NSString stringWithFormat:@"     %@",self.arr3[indexPath.row]];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    [self normalCell:cell arrow:indexPath];
    return cell;
}
//设置箭头和初始化cell
- (void)normalCell:(UITableViewCell *)cell arrow:(NSIndexPath *)indexPath
{
    //右箭头
    if((indexPath.section == 0 && indexPath.row != 2) ||(indexPath.section == 2 && indexPath.row != 0)){
        UIImageView * arrow = [MyControl createImageViewWithFrame:CGRectMake(570/2, 10, 20, 20) ImageName:@"14-6-2.png"];
//        [cell addSubview:arrow];
        cell.accessoryView = arrow;
    }
    
    cell.selectionStyle = 0;
    cell.backgroundColor = [UIColor clearColor];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"账户设置";
    }else if(section == 1){
        return @"同步分享";
    }else{
        return @"其他";
    }
}
-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            NSLog(@"收货地址");
            AddressViewController *address = [[AddressViewController alloc]init];
            [self presentViewController:address animated:YES completion:^{
                [address release];
            }];
        }
    }else if (indexPath.section == 1){
        
    }else if (indexPath.section == 2){
        if (indexPath.row == 3) {
            FeedbackViewController *feedBackVC = [[FeedbackViewController alloc] init];
            [self presentViewController:feedBackVC animated:NO completion:^{
                [feedBackVC release];
            }];
        }
    }
}

#pragma mark - switchChanged
-(void)switchChanged:(UISwitch *)_switch{
    if (_switch == sinaBind) {
        NSLog(@"%d", _switch.on);
    }else if(_switch == sina){
        NSLog(@"%d", _switch.on);
    }else{
        NSLog(@"%d", _switch.on);
    }
}

#pragma mark - fileSize && clearData
//计算总文件大小
-(float)fileSizeForDir:(NSString*)path//计算文件夹下文件的总大小
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    float size = 0;
    NSArray* array = [fileManager contentsOfDirectoryAtPath:path error:nil];
    for(int i = 0; i<[array count]; i++)
    {
        //        NSLog(@"%d--%@", array.count, [array objectAtIndex:i]);
        NSString *fullPath = [path stringByAppendingPathComponent:[array objectAtIndex:i]];
        
        BOOL isDir;
        if ( !([fileManager fileExistsAtPath:fullPath isDirectory:&isDir] && isDir) )
        {
            NSDictionary *fileAttributeDic=[fileManager attributesOfItemAtPath:fullPath error:nil];
            //            NSDictionary *fileAttributeDic=[fileManager attributesOfFileSystemForPath:fullPath error:nil];
            size += fileAttributeDic.fileSize/ 1024.0/1024.0;
        }
        else
        {
            [self fileSizeForDir:fullPath];
        }
    }
    [fileManager release];
    return size;
}
#pragma mark -清除数据
-(void)clearData
{
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    [MMProgressHUD showWithStatus:@"清除中..."];
    
    NSString *cachPath = DOCDIR;
    //    NSLog(@"%@", cachPath);
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
    NSLog(@"files :%d",[files count]);
    for (NSString *p in files) {
        NSError *error;
        NSString *path = [cachPath stringByAppendingPathComponent:p];
        if (!([path hasSuffix:@".png"] || [path hasSuffix:@".jpg"] || [path hasSuffix:@".jpeg"] || [path hasSuffix:@".bmp"])) {
            continue;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        }
    }
    fileSize = [self fileSizeForDir:DOCDIR];
    cacheLabel.text = [NSString stringWithFormat:@"%.1fMB", fileSize];
    NSLog(@"%f", fileSize);
    
    [MMProgressHUD dismissWithSuccess:@"清除成功"];
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
