//
//  AppointmentsViewController.h
//  DrApp
//
//  Created by Daniel Isaac Ithi on 27/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface AppointmentsViewController : UIViewController<UITextFieldDelegate,MFMessageComposeViewControllerDelegate>
{
    
    UITextField *nameText;
    UITextField *mobText;
}
@end
