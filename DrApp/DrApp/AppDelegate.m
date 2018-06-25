//
//  AppDelegate.m
//  DrApp
//
//  Created by Nallasivakumar C on 18/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "AppDelegate.h"
#import "homeViewController.h"
#import "ContactViewController.h"
@import Firebase;
@interface AppDelegate ()
 
@end

@implementation AppDelegate
@synthesize window;
@synthesize navigationController,selectedId;
 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Use Firebase library to configure APIs
    [FIRApp configure];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    homeViewController *viewController = [[homeViewController alloc] init];
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
     self.window.rootViewController = self.navigationController;
    //self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.navigationBar.backgroundColor= [UIColor colorWithRed:255.0/255.0 green:71.0/255.0 blue:87.0/255.0 alpha:1.0];
    [self.window makeKeyAndVisible];
    
   // self.navigationController.navigationBarHidden = YES;
    [self tabbarControl];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];

    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor colorWithRed:153/255.0 green:192/255.0 blue:48/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, UITextAttributeTextColor,
                                                       nil] forState:UIControlStateHighlighted];
    
    
    
    
    
    return YES;
}
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return NO;
//}
- (void)tabbarControl
{
    selectedId = 0;
    
    UIView *tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-60, [[UIScreen mainScreen] bounds].size.width, 60)];
    tabBarView.tag = 101;
    tabBarView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:71.0/255.0 blue:87.0/255.0 alpha:1.0];
    [UIColor colorWithRed:171.0f green:184.0f blue:57.0f alpha:0.1];

    [self.navigationController.view addSubview:tabBarView];
  
    NSMutableArray *menuItems = [[NSMutableArray alloc] initWithObjects:@"HOME",@"CONTACT",@"SHARE", nil] ;
    float w = tabBarView.frame.size.width/menuItems.count;
     float offset = 5.0f;
    
    
    
    
    for (int i = 0; i < menuItems.count; i++) {
        int ID = i;
        NSString *imgName = [NSString stringWithFormat:@"%@.png",[menuItems objectAtIndex:i]];
        UIImage *image = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        float  imgWidth = image.size.width/2;
        int y = -((image.size.height/2) + offset -30);
        float x = i * w + (w- imgWidth)/2;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = ID;
        [button setBackgroundColor:[UIColor clearColor]];
        [button setImage:image forState:UIControlStateNormal];
        button.frame = CGRectMake(x,y,  imgWidth, image.size.height/2);
        [button addTarget:self action:@selector(tabItemSelected:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarView addSubview:button];
        
        UILabel *itemName = [[UILabel alloc] initWithFrame:CGRectMake(i*w,tabBarView.frame.size.height-20,w,15)];
        itemName.font = [UIFont fontWithName:@"Futura-Medium" size:12.0f];
        itemName.textAlignment = NSTextAlignmentCenter;
        itemName.textColor = [UIColor whiteColor];
        itemName.text = [menuItems objectAtIndex:i];
        [tabBarView addSubview:itemName];
        
    }
}

-(void)tabItemSelected:(UIButton *)button{
 
    if (button.tag == 0 && selectedId!=button.tag )
    {
        selectedId = (int)button.tag;

        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else if (button.tag == 1 && selectedId!=button.tag)
    {
         selectedId = (int)button.tag;
        [self.navigationController popToRootViewControllerAnimated:NO];

        ContactViewController * mView = [[ContactViewController alloc] init];
        [self.navigationController pushViewController:mView animated:YES];
    }
    else if (button.tag == 2 && selectedId!=button.tag )
    {
        selectedId = (int)button.tag;
        
        
       
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
