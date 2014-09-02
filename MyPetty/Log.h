/*
 ---开发日志---
 
 阿猫阿狗项目
 开始时间：2014.05.26
 开发人员：苗翠林
 
 2014.05.26-2014.05.30
 1.了解熟悉项目流程，任务，目的。
 2.搜集素材，完成瀑布流，Aviary SDK模块的实现。
 3.界面构思，开始搭建界面：首页，随机页，详情页，喜爱页，个人中心页。多次利用单例解决
   页面跳转的问题。
 4.假数据填充，并各测试模块，修复bug。
 5.添加毛玻璃效果，在未登录时进入毛玻璃登录页，使用了
    [[UIApplication sharedApplication].keyWindow addSubview:view];
   代码，弹出能够盖住导航的UI控件。
 6.细节方面的处理，优化。
 
 2014.06.03
 1.相机拍照以及状态栏颜色bug修复。
 2.搭建注册页面，2个页面平铺到一个scrollView上。选择宠物种类中用到了UIPickerView。

 2014.06.04
 1.完成新浪微博的第三方登录，能够获取用户的数据。
 2.第三方登录与app注册模块结合，最终获取到一个api字符串，用于注册。字符串中有注册时填写的各种信息+用户第三方id+SID。
 3.尝试与自家服务器交互。
 4.注册数据的填充以及界面的优化。
 
 
 2014.06.05
 1.修改注册页，添加邀请码。
 2.将注册页面衔接到项目中。
 3.个人中心页添加积分功能。
 
 
 2014.06.06-2014.06.11
 1.与服务器进行各种交互，调试注册时的严重bug。bug原因是请求API中含有中文字符，转成UTF8格式即可。
 
 
 2014.06.12
 1.修改favorite页及random页的图片加载大小及心的点击和点赞数+1。favorite页
   增加用户头像及姓名。
 2.实现其他用户主页，关注及取消关注。
 
 2014.06.13
 1.实现个人主页的关注及取消关注。
 2.实现点赞功能。
 
 2014.06.16
 1.增加照片发布时间，几分钟前，几天前等。
 2.修复详情页进入崩溃问题。random页没有返回likers参数。
 3.个人中心添加经验一项，随着经验值变化进度条变化，相关图片也跟着变化。
 4.修改一些图片，添加图片。
 5.将个人中心页点击经验或设置后隐藏照片栏。
 
 2014.06.17
 1.修复粉丝关注的实时更新。
 2.解决mantis上的部分问题。
 
 2014.06.18
 1.增加每一页的照片，头像缓存到本地。
 2.favorite等页的图片展示横向充满屏幕处理。裁剪图片再选取其中一部分。原图和小图都存放到本地。
 
 2014.06.19-2014.06.20
 1.详情页页面调整，搭建新的页面Menu
 2.修改一些崩溃bug以及逻辑设计问题。
 
 2014.06.22
 1.微博绑定，微信无法授权。
 2.更改注册页面，添加有微博的注册。
 
 2014.06.23
 1.上下拉刷新改成中文。
 2.其他人主页，点击照片跳转详情页。
 3.修改几个地方宠物类型显示的bug。
 4.调整详情页点赞位置，3.5及4寸屏第一屏都会有点赞。
 5.微博授权页面暂时没有弹出。
 
 
 2014.06.24
 1.启动登录页面及初始界面的动画。
 2.注册页面的修改。
 3.设置页微信绑定去掉。
 4.Loading状态的显示。
 5.注册页及头像更换页面添加头像编辑功能。
 6.服务器返回errorCode为-1进行弹窗通知用户。
 
 --张景瑞接管--
 2014.06.25
 1.详情页面的修改，点击以后背景变为黑色，图片在最上层
 
 2014.06.26
 1.注册后菜单页不能及时更新用户信息。
 2.注册是的完成按钮的变化
 3.关注页面好友没有图片弹出提示

 2014.06.27
 1.进入应用主页，瀑布流下方显示有空白
 2.详情页评论超过1行后显示不全。
 
 --苗翠林接管--
 2014.06.29
 1.活动3个界面的搭建。
 2.了解这3天的改动以及API的变化。
 3.修复一些小BUG，着手增加各个页面的上下拉刷新。
 
 2014.06.30
 1.menu页增加动画。
 2.活动列表页与网络交互。
 3.修改mantis上M1的bug。包括关注页的上下拉刷新以及个人主页关注，取消关注之后的跳回问题等。
 4.一些图片及界面优化的细节调整。
 5.个人主页及其他人个人主页照片的上下拉刷新。
 6.照片编辑取消后，跳回选择照片或拍照页。
 
 2014.07.01
 1.降低推荐页留白出现概率。在cell中下载完新的图片后执行reloadData。未下载图片添加默认图片来增加用户体验。
 2.活动界面的数据交互及界面完善。
 3.menu页添加消息选项以及活动，消息通知数。
 4.个人主页增加或取消关注的bug修复。
 5.mantis上M1BUG修复。
 6.开始搭建新图片上传界面。
 
 2014.07.02
 1.修复mantis上M1,M2部分bug。
 2.搭建新的图片上传界面，微博分享，微信朋友圈分享，以及设置页的选项相联系。
 3.部分图片的更换。
 4.注册时种类的bug修复。
 
 2014.07.03
 1.mantis M1bug清空，部分M2 bug修改。
 2.增加消息界面。
 3.图片大小调整，注册页部分修改。
 4.图片详情页加载时增加返回键。
 5.增加上传照片长宽比及尺寸大小限制。
 
 2014.07.04 iOS
 1.个人主页关注及粉丝增加上下拉刷新
 2.注册增加年龄限制，小于100岁。
 3.增加发布图片文字限制，不多于40个字。
 4.活动详情页添加参加活动按钮。
 5.mantis上M2 bug修复，部分崩溃问题修复。
 
 2014.07.07
 1.个人主页添加新浪微博，点击查看自己的昵称和图片。
 2.照片发布页增加同步发布到微博和微信。
 3.mantis上部分问题修改。
 4.清除缓存弹窗修改。
 
 2014.07.08
 1.毛玻璃效果的处理。
 2.iOS部分界面矫正。
 3.详情页分享功能重新搭建。
 4.部分mantis M3 bug的修复。
 5.详情页点赞之后头像立即添加，取消赞之后立即消除。
 
 2014.07.09
 1.添加消息页与网络数据的交互，添加了上下拉刷新。
 2.menu页活动及消息数实时更新。
 3.上一个版本点赞crash的修复。
 4.消息页添加删除功能，每一行左滑点击删除即可。暂不支持垃圾箱一键删除。
 5.mantis部分 M3 bug修复。
 6.详情页分享界面更改。
 
 2014.07.10
 1.照片发布页输入框位置异常的修复。
 2.推荐及关注页添加新的加载动画。
 3.照片发布页文字输入及字数提示效果的修改。
 4.注册时键盘遮挡的问题。
 5.已结束的活动修改为不可再参加。
 6.个人主页，设置，经验页的微博点击查看自己的微博，未授权时为灰色图。
 7.mantis M3部分bug修复。
 8.为适配iOS6.0系统做出部分调整。
 
 2014.07.11
 1.添加评论功能。
 2.mantis M3 bug 修改。
 3.其他人主页上滑顶栏停靠。
 
 2014.07.14
 1.解决清除缓存之后再进入详情页点赞和评论会消失的问题。
 2.发消息功能的添加，在其他人主页右上角。
 
 2014.07.15
 1.反馈页面的搭建，现在可以发送，开发人员可以看到反馈。
 2.主页菜单按钮为避免快速点击做相应限制。
 3.修改进入消息页崩溃问题，测试人员可测试一下还有没有几率崩溃。
 4.发送消息页增加空消息限制。
 5.其它人主页界面微调整。
 6.解决menu界面中，按钮亮度在非点击情况也会发亮。
 7.消息发送页点击空白处键盘收回。
 8.菜单页和其他人主页头像点击放大。
 
 2014.07.16
 1.分析内存泄露与内存警告问题。
 2.详情页顶栏头像修改为不透明。
 3.修复关注和粉丝重复的问题。
 4.进入其他人主页动画颜色及位置的修正。
 5.mantis 453，441 的修改。
 
 2014.07.17
 1.照片详情页点评论之后点分享的问题。
 2.发布页跳回到照片编辑页。
 3.修复发送消息页发送时的崩溃问题。
 4.去掉了编辑照片之后图片自动保存到本地的功能，防止系统相册出现很多杂乱的照片，影响用户体验。
 5.分享时去掉取消按钮，背景图点击让分享消失。
 6.意见反馈页面邮箱添加格式判断，添加无阻隔弹框，对键盘类型及按键的相应处理。
 7.修复mantis bug 448.

 2014.07.18
 1.解决发送消息时消息及顶栏超出屏幕外的情况。
 2.mantis bug 455,474,412,279,105。
 3.对推荐页瀑布流图片高度进行优化，避免出现很窄的图片。
 4.推荐页滑到底端自动加载更多图片。
 
 2014.07.21
 1.研究毛玻璃效果。
 
 2014.07.22
 1.评论崩溃问题及细节调整。
 2.发消息页添加背景色毛玻璃底图。
 3.在首页逻辑上进行处理，解决了进入首页之后注册用户也让重新注册的情况。
  处理逻辑：【1】当先下载完登录数据，再出现动画，动画播放完后直接跳转。
          【2】当动画播放完后，登录数据还没下载完，等数据下载完后直接跳转。
          【3】当动画播放过程中，登录数据下载完，将isLogined置为1。等播放完后判断该值为1后直接跳转，否则设置isAnimation为1.

 2014.07.23
 请病假
 
 2014.07.24
 百度地图使用步骤:
 1.打开网站http://lbsyun.baidu.com/apiconsole/key创建应用，输入bundle identifier的全称，获取AK值。
 2.创建工程，导入inc文件夹(各种头文件)、mapapi.bundle、静态库：(合并后的，终端输入lipo -create Release-iphoneos/libbaidumapapi.a Release-iphonesimulator/libbaidumapapi.a -output libbaidumapapi.a)。
   导入框架:CoreLocation,QuartzCore,OpenGLES,SystemConfiguration,Security。
 3.AppDelegate扩展名改为.mm。导入头文件 "BMapKit.h"，创建全局变量 BMKMapManager * _mapManager;
 4.//启动百度地图
 _mapManager = [[BMKMapManager alloc] init];
 BOOL ret = [_mapManager start:@"LU6Ku2Z58cjiO1DuQlid0UNp" generalDelegate:nil];
 if (!ret) {
 NSLog(@"manager start failed");
 }
 5.【疑问】百度地图如何定位自己。
 _mapView.showsUserLocation = YES;
 -(void)createLocation
 {
 _locService = [[BMKLocationService alloc] init];
 _locService.delegate = self;
 
 [_locService startUserLocationService];
 
 _mapView.showsUserLocation = NO;//先关闭显示的定位图层
 _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
 _mapView.showsUserLocation = YES;//显示定位图层
 }
 #pragma mark - 代理
 -(void)didUpdateUserHeading:(BMKUserLocation *)userLocation
 {
    [_mapView updateLocationData:userLocation];
 }
 -(void)didUpdateUserLocation:(BMKUserLocation *)userLocation
 {
    [_mapView updateLocationData:userLocation];
 }

 2014.07.25
 1.摇一摇
 
 2014.07.28
 1.录音和播放声音实现。
 2.了解内购系统。
 
 2014.07.29
 1.主页滑动效果设计。
 2.抽屉效果。
 
 2014.07.30
 1.抽屉菜单页各页面之间的切换的研究。
 2.录音及播放音频处理。

 2014.07.31
 1.使用苹果原生定位。
 2.修正了抽屉菜单页之间切换的问题。
 3.摇一摇功能扩展，看能否识别摇动时间及幅度。（遇到问题，广场中motionBegan方法不识别）
  结果：暂时没找到有该功能。
 
 2014.08.01
 1.新增开场2个界面，增加动画效果。
 2.首页导航栏两个按钮，抽屉和相机，加入未注册判断。
 3.界面连接，开场后点击汪星或喵星进入，之后点击创建或加入进入主页，主页点击左上角打开抽屉，右上角拍照传图片。

 2014.08.04
 1.选择王国和搜索王国界面的搭建。
 2.新注册页面的搭建。
 
 2014.08.05
 1.完善新注册页面。
 2.搭建新菜单页。
 
 2014.08.06
 1.注册页面增加全国省市区的选择器。
 2.界面中一些小功能的研究。
 
 2014.08.07
 1.Xcode证书修复。
 2.选择王国页，点击王国出现该国详细信息。
 3.点击“种类”和“按系统推荐”弹出二级菜单供选择。
 
 2014.08.08
 1.注册页面漏出半边的修改，坐标调整，修正其中的几个小bug。
 2.全国各地区去掉三级目录，将第三级的直辖市改到第二级。
   bug1:刚出现时北京的区在昌平。
   bug2:北京，滑到最下边，省份滑到其他省松手，第二栏消失了。
 以上两个bug已修复。
 3.侧边栏界面按照新模板修改。
  
 
 2014.08.11
 1.宠物资料页的重新构建。
 
 2014.08.12
 1.宠物资料头像背景毛玻璃化。
 2.人气值边角处理。
 3.用户资料页面的基本架构。
 4.国家列表的cell定制。
 
 2014.08.13
 1.实现左滑cell出现2个按钮，退出国家及置顶。
 2.实现底部的弹出菜单。弹出4个按钮。
 3.点击退出国家删除此条。
 
 2014.08.14
 1.底部弹出菜单简化修改，直接弹出4个按钮。
   修改4个按钮位置并且添加相应文字。
 2.底部菜单适配4.0寸屏幕。
 3.擦除毛玻璃效果。
 
 2014.08.15
 1.看效果图，考虑其中的功能点。
 2.总结流程疑问，开会解决。
 3.考虑底部头像按钮具体应用出现问题的解决方法。
 4.工作计划的制定。
 
 2014.08.19
 1.选择登录与创建国家界面的修改
 2.首页布局的修改以及3个按钮的添加（部分未完成）
 3.截屏毛玻璃化
 
 2014.08.20
 1.首页滑动切换。
 2.选择国家界面的修改。
 
 2014.08.21
 1.注册页面修改。
 2.选择国家页面图片查看可滑动。
 
 2014.08.22
 1.选择国家搜索界面实时筛选(中文搜索未实现)。
 2.注册页面键盘弹出bug修复。
 3.侧边栏的界面修改(国家循环未实现)。
 4.照片详情页的搭建。
 
 2014.08.23
 1.国家切换。
 
 2014.08.25
 1.照片详情页搭建。
 2.我的王国第一个界面。
 
 2014.08.26
 1.我的王国剩余3个界面。
 2.底部menu大小比例修改。
 3.个人资料页第一页修改。
 
 2014.08.27
 1.个人资料剩余3个页面。
 2.侧边栏搜索功能的添加。
 3.照片发布页的修改。
 
 
 2014.08.28
 1.@用户页 勾选时button复用会出现多个勾。已解决。
 2.#话题页。
 3.#话题回传。
 4.礼物商城。
 
 2014.08.29
 1.人气榜
 2.贡献榜
 
 2014.08.30
 1.活动页面修改。详情页未改动。以后做。
 2.王国、个人资料页more功能。
 3.个人主页第7种情况添加。
 
 2014.09.01
 1.menu直接关联的页面添加50%半透明黑色alphaBtn，当侧边栏出现时出现按钮出现，防止
   用户在侧边栏点击右边界面的控件。
 2.排行榜优化。
 3.关于我们页面。
 
 2014.09.02
 1.注册api的整合。
 2.城市代号规则：4位数字代表，1000  10代表北京，00代表北京第一个区。1108中11代表天津 08代表天津第9个区。
 //
 1.活动页面。
 2.注册流程限制。
 
 
 
 
 
 /*********************测试结果************************/
王妍的测试：
Ios界面样式测试，机型4s

侧边栏：
搜索条在未输入的状态下不显示取消，应是点击之后再显示取消
放大镜图标太靠左了
背景应是毛玻璃效果
设置项显示不出穿越来，也不能向上滑动
设置项按住不放时的深色底高度不够

商城
价格选择“由高到低”之后再点击“由高到低”时最上面一栏应变为价格（参考安卓）

排行榜
高度应为普通项的1.5倍
选择日榜月榜的下拉菜单应取消阴影

我的王国
用户资料
创建王国的“+”应为居中显示

照片详情
页面显示不全，向上滑动时滑不到底部，看不到最下面评论和其他内容
/*********************测试结果(已解决)************************/
 /*
  1.设置收货地址
  保存按钮太小了

  2.
 */

 
 
 
 
 
 
 
 
 
 
 
 
 
 /*********************流程疑问**********************
 1.登录星球页效果。   地球周期性跳动，两个云彩移动。
 2.创建王国效果。
 3.注册页面可以不传头像注册么。  有默认头像。注册完进我的王国。
 4.选择王国两个下拉菜单的具体文字。
 5.加入跳注册页面自动填充第一页是吧？  是。
 6.国家详情有可以点的地方么。  图片点击放大，可以左右切换。点头像进主页。
 7.首页按钮只能点，不能不能滑吧。点击变橙色？  首页3个页面滑动切换。照片按钮只有主人登录时才有。
 8.底部4个按钮分别调到的页面还没给。  4个按钮做动作是对当前页面。需加判定。
 9.侧边栏各个按钮及国家切换具体效果。
 10.照片详情页各个按钮的功能。
 11.围观群众送礼物和发私信。
 12.我的王国。7个效果。       点头像进入自己主页。
 13.用户资料活动页解释。
 14.所有界面都是顶栏85%半透明橙色么？  是。
 15.设置页面底层图片是固定的么？同步开关默认开启么？
 16.收货地址3栏是么？  2栏
 17.各个弹窗出现的时机。  
 18.商城滑动效果？右上角是购物车么？
 19.人气榜与贡献榜的效果。
 20.发布照片页。
 21.@用户页。

 
 
 **************************************************/
 
 /***********************计划************************
   1.选择登录与创建国家。        1天。
   2.注册页面。                 半天。
   3.选择王国2个页面修改。       1天。
   4.主页瀑布流上3个悬浮按钮。    半天。
   5.侧边栏图标修改及国家切换效果。 半天。
   6.照片详情页。                1天。
   7.围观群众页。                3小时。
   8.我的王国界面4个选项。        2天。
   9.用户资料各个选项。           2天。
 
   11.设置页面。                1天。
   12.收货地址，意见反馈。        1天。
   13.消息界面，聊天界面。        1天。
   14.加金币弹窗，登录奖励弹窗，送礼物弹窗。  1天。
   15.礼物商城。                 2天。
   16.礼物详情页。               半天。
   17.人气榜，贡献榜。            2天。
   18.照片发布页，话题，用户页。    2天。
   19.底部菜单4个页面。           2天。
   20.内购功能                   2天。
  
   10.活动界面及详情页。          2天。
 约26天。
 **************************************************/


//未完成
/*
 5.tableView上滑过程中切换会出bug。(未解决)可以在滑动中关闭按钮交互。
 7.摸一摸做成一个毛玻璃，慢慢擦除之后就任务完成。
 9.国家的切换。
 10.宠物种类plist文件服务器取消回传，自己创建本地plist文件存储和取用。
 
 
 *******************未完成的任务**********************
 优先完成顺序：8,5,6,7,13,2,1。
 
 1.点赞红心会乱。                          半天
 //2.注册后菜单页不能及时更新用户信息。          半天
 //3.关注页增加上下拉刷新，尝试用MJRefresh。    半天
 4.瀑布流的改善。                          半天到一天
 //5.注册和可以换头像的地方增加头像编辑功能。     1-2小时
 6.点赞列表进入我的个人中心崩溃。              2小时
 //7.进入各个界面加载数据时显示Loading界面。     半天到一天
 //8.注册页面修改，直接注册。                   2-3小时
 //9.主页面展示服务器返回的图片，增加放大效果。    2小时
 10.注册重名，用毛玻璃view显示，盖在上层。      2小时-半天
 //11.修改照片投稿页。                         2-3小时
 12.设置页，反馈等信息的完善。                 半天
 //13.每次请求服务器数据，如果返回errorCode为-1都要弹窗，显示。  2-3小时。
 
 14.界面优化，动画效果的添加。
 15.代码优化，减少app体积，减少流量的使用。
 16.用户体验的修改，各种bug调试。
 17.中途更改需求预留时间。            14-17项所用时间视当时情况而定，暂定一周。
 
 由于25-27号要回学校参加毕业典礼，耽误3天，暂定上线时间2-3周，突发事件除外。
 
 补充：
 1.经验值的地方增加还差多少经验升级的Label。
 //2.开机启动图片，每天一换，检测本地图片是否跟要显示的一致，不一致，下载图片，并保存到本地。
 //3.详情页评论超过1行后显示不全。
 4.详情页可以识别重力感应。
 //5.菜单里，活动页面的添加。
 //6.各个地方图片超过10或30张的要请求更多API。
 7.推荐页列表由于两边不等长，有空白，要求请求到空白处就请求下一组数据。  &&&&&重要&&&&&&
 //8.下拉时上拉会崩溃。尝试free试试。
 9.关注页和详情页之间点赞切换还是有问题，不能及时更新，再有详情页点赞之后下面点赞人的现实也要及时更新。
 10.推送的添加。
 11.消息页面，活动详情页，反馈，注册页面修改，查看微博界面，输入密码找回界面。
 //12.新照片发布页的评论框位置变化异常。
 //13.菜单头像应该不透明
 14.自己关注或取消关注别人后一定要刷新关注页及个人首页。
 //15.照片详情页点赞之后重影了。底层的没有销毁。
 16.网络不好时推荐页的下拉刷新会卡住。
 //17.加载的时候加一个毛玻璃或半透明背景。
 18.点赞或取消赞之后进入参与用户页没有添加或删除自己。
 19.页面的虚化效果。
 20.点赞放大效果。
 21.发布-》取消授权-》发布快速重复3次会崩溃，提示message sent to deallocated instance.已向友盟邮箱发送邮件。
 //22.详情页图片太小的话无法充满屏。

 //23.清除缓存之后再进入详情页点赞和评论会消失。
 24.有时会出现进入大图白屏的情况，1分钟后会出结果。
 25.出现重新注册的情况，原因是loginApi未请求完。isSuccess的值为0.
 
 ***********新功能***************
 26.添加内购系统，涉及支付。
 27.LBS系统，搜索附近人等。
 28.连连看，2048等小游戏，玩会增加玩家经验，移植进APP即可。
 
 29.增加国王，丞相，将军等官职。
    4个功能点：送礼品、叫一声(摸一摸)、摇一摇、遛一遛。
    宠物点值：人气值、体力值。
    主人点值：金币、经验值、贡献值
    其   它：人气榜，贡献榜，最新动态，各种动画效果。
 
 
 *******************未完成的任务**********************
 */
