//
//  AppointmentsViewController.m
//  DrApp
//
//  Created by Daniel Isaac Ithi on 27/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "AppointmentsViewController.h"

@interface AppointmentsViewController ()

@end

@implementation AppointmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Appointments";

    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-60)];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    bgView.image = [UIImage imageNamed:@"appointmentBg.png"];
    bgView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:bgView];
    
    
    UIImageView  * profileImg = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)-75,70,150,150)];
    profileImg.layer.cornerRadius = 75.0f;
    profileImg.contentMode = UIViewContentModeScaleAspectFill;
    profileImg.layer.borderColor = [UIColor whiteColor].CGColor;
    profileImg.layer.borderWidth = 2.5f;
    profileImg.image = [UIImage imageNamed:@"profileImg.jpg"];
    [profileImg.layer setMasksToBounds:YES];
    [self.view addSubview:profileImg];

    UILabel *headerLbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 220, self.view.frame.size.width, 40)];
    [headerLbl setText:@"DR.SUVENDU NARAYANA MISHRA"];//Set text in label.
    headerLbl.textColor = [UIColor whiteColor];
    headerLbl.font = [UIFont fontWithName:@"Futura-Medium" size:20.0f];
    headerLbl.backgroundColor = [UIColor clearColor];
    headerLbl.textAlignment = NSTextAlignmentCenter;
    [headerLbl setNumberOfLines:0];//Set number of lines in label.
    [self.view addSubview:headerLbl];//A
    
    UILabel *headerLblDesc=[[UILabel alloc]initWithFrame:CGRectMake(0, 260, self.view.frame.size.width, 60)];
    [headerLblDesc setText:@"       Consultant Neuropsychiatrist, Sexologist, Drug De-addiction Specialist"];//Set text in label.
    headerLblDesc.lineBreakMode = UILineBreakModeWordWrap;// add this line
    headerLblDesc.numberOfLines = 0;
    headerLblDesc.textColor = [UIColor whiteColor];
    headerLblDesc.backgroundColor = [UIColor clearColor];
    headerLblDesc.font = [UIFont fontWithName:@"Futura-Medium" size:14.0f];
    headerLblDesc.textAlignment = NSTextAlignmentCenter;
    [headerLblDesc sizeToFit];
    [self.view addSubview:headerLblDesc];//A
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(10, 310, self.view.frame.size.width-20, self.view.frame.size.height-160)];
    paddingView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:paddingView];
    
    UILabel *nameLbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 40)];
    [nameLbl setText:@"NAME"];//Set text in label.
    nameLbl.font = [UIFont boldSystemFontOfSize:18.0f];
    nameLbl.backgroundColor = [UIColor clearColor];
    [nameLbl setTextColor:[UIColor whiteColor]];//Set text color in label.
    [nameLbl setTextAlignment:NSTextAlignmentLeft];//Set text alignment in label.
    [nameLbl setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [nameLbl setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [nameLbl setNumberOfLines:1];//Set number of lines in label.
    [nameLbl.layer setBorderColor:[UIColor blackColor].CGColor];//Set Border color.
    [paddingView addSubview:nameLbl];//A
    
    nameText = [[UITextField alloc] initWithFrame:CGRectMake(10, 40, self.view.frame.size.width-40, 40)];
    nameText.borderStyle = UITextBorderStyleRoundedRect;
    nameText.font = [UIFont systemFontOfSize:15];
    nameText.placeholder = @"Enter Your Name";
    nameText.autocorrectionType = UITextAutocorrectionTypeNo;
    nameText.keyboardType = UIKeyboardTypeDefault;
    nameText.returnKeyType = UIReturnKeyNext;
    nameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    nameText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    nameText.delegate = self;
    [paddingView addSubview:nameText];
    
    UILabel *mobLbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 80, 150, 40)];
    [mobLbl setText:@"MOBILE NO"];//Set text in label.
    mobLbl.font = [UIFont boldSystemFontOfSize:18.0f];
    mobLbl.backgroundColor = [UIColor clearColor];
    [mobLbl setTextColor:[UIColor whiteColor]];//Set text color in label.
    [mobLbl setTextAlignment:NSTextAlignmentLeft];//Set text alignment in label.
    [mobLbl setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [mobLbl setLineBreakMode:NSLineBreakByCharWrapping];//Set linebreaking mode..
    [mobLbl setNumberOfLines:1];//Set number of lines in label.
    [mobLbl.layer setBorderColor:[UIColor blackColor].CGColor];//Set Border color.
    [paddingView addSubview:mobLbl];//A
    
    mobText = [[UITextField alloc] initWithFrame:CGRectMake(10, 120, self.view.frame.size.width-40, 40)];
    mobText.borderStyle = UITextBorderStyleRoundedRect;
    mobText.font = [UIFont systemFontOfSize:15];
    mobText.placeholder = @"Enter Your Mobile No";
    mobText.autocorrectionType = UITextAutocorrectionTypeNo;
    mobText.keyboardType = UIKeyboardTypeDefault;
    mobText.returnKeyType = UIReturnKeySend;
    mobText.clearButtonMode = UITextFieldViewModeWhileEditing;
    mobText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    mobText.delegate = self;
    [paddingView addSubview:mobText];
}
- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([nameText.text isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Please enter your name"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }else if ([mobText.text isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Please enter your mobile number"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
        
        if(textField == nameText) {
            [textField resignFirstResponder];
            [mobText becomeFirstResponder];
        }else if (textField == mobText)
            [textField resignFirstResponder];
        
        NSArray *recipents = @[@"9078979580", @"9861273580"];
        //NSArray *recipents = @[@"7483092256"];

        NSString *message = [NSString stringWithFormat:@"Name - %@ \nMobile Number - %@\n\nSent from iOS App",nameText.text,mobText.text];

        
        MFMessageComposeViewController *textComposer = [[MFMessageComposeViewController alloc]init];
        [textComposer setMessageComposeDelegate:self];
        
        if ([MFMessageComposeViewController canSendText]) {
            [textComposer setRecipients:recipents];
            [textComposer setBody:message];
            [self presentViewController:textComposer animated:YES completion:nil];
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
            [textComposer preferredInterfaceOrientationForPresentation];
        }
        else {
            NSLog(@"SMS not working.");
        }
        /*
        
         */
    }
    
    return YES;

}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"Thank you for booking an appointment, we will contact you soon."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger) buttonIndex
{
    if (buttonIndex == 0)
    {
        NSLog(@"Cancel Tapped.");
        [self.navigationController popViewControllerAnimated:YES];
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
