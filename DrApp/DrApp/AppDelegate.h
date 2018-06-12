//
//  AppDelegate.h
//  DrApp
//
//  Created by Nallasivakumar C on 18/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import <UIKit/UIKit.h>
@class homeViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIGestureRecognizerDelegate,UIActionSheetDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)  UINavigationController * navigationController;
@property int selectedId;
@end

