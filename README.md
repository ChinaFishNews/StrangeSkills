# StrangeSkills
iOS开发的一些奇巧淫技,
"奇巧淫技"并非是一些稀奇古怪的技术要点，也不是什么所谓的黑科学，只是一些平时可能会用到但有些又并不是很容易查询得到的小tips.
<br>博客地址:http://chinafishnews.github.io

##<br>如何查看真机沙盒文件?

一：安装iFunBox或IExployer

二：在xcode的上部导航栏里，选择window -> Devices,找到目标app![](https://github.com/ChinaFishNews/StrangeSkills/blob/master/Images/1.png),双击选中项目![](https://github.com/ChinaFishNews/StrangeSkills/blob/master/Images/2.png),这样我们只能看到沙盒的目录结构,看不到实体文件。然后点击Download Container![](https://github.com/ChinaFishNews/StrangeSkills/blob/master/Images/3.png),下载后保存到桌面，右键显示包内容即可。



##<br>如何使用命令行进行打包?

一： 使用原生xcodebuild、xcrun 打开终端 cd到当前项目,使用如下两条命令即可。
###如果项目没有使用cocoapods:
xcodebuild -project 项目名.xcodeproj -target 项目名 -configuration Release(生成项目名.app文件)
<br>xcrun -sdk iphoneos -v PackageApplication ./build/Release-iphoneos/项目名.app -o ~/Desktop/项目名.ipa(-o前为.app文件路径，-o后为生成的.ipa路径)
###如果使用cocoapods:
xcodebuild -workspace Test.xcworkspace -scheme Test -configuration Release
<br>xcrun -sdk iphoneos -v PackageApplication 项目名.app路径 -o ~/Desktop/Demo.ipa


二：使用xctool进行自动打包，是FaceBook开源的一个命令行工具，可使用brew安装（安装命令：sudo brew install xctool）
###如果项目没有使用cocoapods:
xctool -scheme Demo archive -archivePath "Demo/“(会生成.xcarchive文件)
<br>xcrun -sdk iphoneos -v PackageApplication ./Demo.xcarchive/Products/Applications/Demo.app -o ~/Desktop/Demo.ipa
###如果使用cocoapods:
xctool -workspace Demo.xcworkspace -scheme Demo archive -archivePath "Demo” 
<br>xcrun -sdk iphoneos -v PackageApplication ./Demo.xcarchive/Products/Applications/Demo.app -o ~/Desktop/Demo.ipa

##<br>Xcode历史版本下载地址<br>
https://developer.apple.com/downloads/


##<br>加急审核渠道链接(并非只是加急，包括向苹果申诉、修改appstore上相关信息等)
https://developer.apple.com/appstore/contact/appreviewteam/index.html
也可以直接从ITunes右下角contact us也可以  但是无法填写相关文字描述


##<br>Autolayout及SizeClass示意图<br>
![](https://github.com/ChinaFishNews/StrangeSkills/blob/master/Images/4.png) ![](https://github.com/ChinaFishNews/StrangeSkills/blob/master/Images/5.png) ![](https://github.com/ChinaFishNews/StrangeSkills/blob/master/Images/6.png)


##窗口中有多个responder,如何快速释放键盘

一：[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];

二：[self.view endEditing:YES];


##<br>  如何去除UITableView中Group样式cell的边框

一： UIView *tempView = [[UIView alloc] init];
  <br> [cell setBackgroundView:tempView];
   <br>[cell setBackgroundColor:[UIColor clearColor]]; 
   
二：tableView.separatorColor=[UIColor clearColor];


##<br>如何解决colorWithPatternImage设置view背景色太占内存问题

  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_landscape.jpg"]];
  <br>切换成self.view.layer.contents =[UIImage imageNamed:@"name.png"].CGImage;
  
##<br>App升级后如何删除NSUserDefaults全部数据

APP升级后，UserDefaults中原有的plist是不会删除的，除非用户卸载APP<br>
NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];  
[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];  

##<br>如何修改图片颜色

先设置图片的渲染模式为UIImageRenderingModeAlwaysTemplate，再设置tintcolor<br>
self.imageView.image = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
self.imageView.tintColor = [UIColor redColor];
<br>也可以在Asset catelog中设置render as<br> ![](https://github.com/ChinaFishNews/StrangeSkills/blob/master/Images/7.png)

##<br>如何放大图片使之不失真且不产生锯齿

在Asset Catalog的Attribtues Pane中设置Single(前提是图片必须是矢量图) Vector为SingleVector<br>![](https://github.com/ChinaFishNews/StrangeSkills/blob/master/Images/8.png)


##<br>如何在拉伸图片的时候使之不变形

一：stretchableImageWithLeftCapWidth: topCapHeight:<br>
二：在Xcode中选中图片，然后点击右下角的Show Slicing：<br>![](https://github.com/ChinaFishNews/StrangeSkills/blob/master/Images/9.gif)

##<br>Storyboard中如何正确设置控件透明度
在直接设置alpha的情况下，如果上面有文字的话会随着透明度的变大而变得越来越不清楚。
<br>此时应该这样设置 Background →0ther →0pacity

##[UIScreen mainScreen].bounds获取屏幕大小不对的问题
\#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width<br>
\#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208),[[UIScreen mainScreen] currentMode].size) : NO)<br>
在标准模式下<br>
6+：<br>
[[UIScreen mainScreen] currentMode].size为{1242，2208}<br>
[UIScreen mainScreen].bounds.size为{414，736}<br>
6:<br>
[[UIScreen mainScreen] currentMode].size为{750，1334}<br>
[UIScreen mainScreen].bounds.size为{375，667}<br>

放大模式下(设置->显示与亮度->显示模式) <br>
6+:<br>
[[UIScreen mainScreen] currentMode].size为{1125,2001}<br>
[UIScreen mainScreen].bounds.size为{375,667}<br>
6:<br>
[[UIScreen mainScreen] currentMode].size为{640,1136}<br>
[UIScreen mainScreen].bounds.size为{320,568}

##Mac模式下如何将视频生成Gif文件
一：使用GifBrewery直接将视频转为gif文件(安装GifBreweryw密码:www.macx.cn)

二：安装ffmpeg ( brew install ffmpeg)使用ffmpeg使视频转为多张图片<br>
（ ffmpeg -i  news.mov -r 10 -f image2 文件夹名/%05d.png）
<br>然后使用PicGIF (将多张图片生成gif文件)

