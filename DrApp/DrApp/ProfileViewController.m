//
//  ProfileViewController.m
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "ProfileViewController.h"
@import Firebase;
@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"Profile";
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-100)];
    //self.view.backgroundColor = [UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];
    //self.view.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:71.0/255.0 blue:87.0/255.0 alpha:1.0];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
    UIImageView  * profileImg = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)-75,20,150,150)];
    FIRStorage *storage = [FIRStorage storage];
    FIRStorageReference *storageRef = [storage reference];
    // Create a reference to the file you want to download
    FIRStorageReference *islandRef = [storageRef child:@"Main/DP.png"];
    // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
    [islandRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData *data, NSError *error){
        if (error != nil) {
            // Uh-oh, an error occurred!
        } else {
            // Data for "images/island.jpg" is returned
             [profileImg setImage:[UIImage imageWithData:data]];

        }
    }];
    profileImg.layer.cornerRadius = 75.0f;
    profileImg.layer.borderColor = [UIColor whiteColor].CGColor;
    profileImg.layer.borderWidth = 2.5f;
    [profileImg.layer setMasksToBounds:YES];
    //[profileImg setBackgroundColor:[UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.]];
    [self.view addSubview:profileImg];
     */
    UIView *profileHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 240)];
    profileHeaderView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:71.0/255.0 blue:87.0/255.0 alpha:1.0];
    [self.view addSubview:profileHeaderView];
    
    UIImageView  * profileImg = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)-75,10,150,150)];
    profileImg.layer.cornerRadius = 75.0f;
    profileImg.contentMode = UIViewContentModeScaleAspectFill;
    profileImg.layer.borderColor = [UIColor whiteColor].CGColor;
    profileImg.layer.borderWidth = 2.5f;
    profileImg.image = [UIImage imageNamed:@"profileImg.jpg"];
    [profileImg.layer setMasksToBounds:YES];
    [profileHeaderView addSubview:profileImg];
    
    UILabel *headerLbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 40)];
    [headerLbl setText:@"DR.SUVENDU NARAYANA MISHRA"];//Set text in label.
    headerLbl.textColor = [UIColor whiteColor];
    headerLbl.font = [UIFont fontWithName:@"Futura-Medium" size:20.0f];
    headerLbl.backgroundColor = [UIColor clearColor];
    headerLbl.textAlignment = NSTextAlignmentCenter;
    [headerLbl setNumberOfLines:0];//Set number of lines in label.
    [self.view addSubview:headerLbl];//A
    
    UILabel *headerLblDesc=[[UILabel alloc]initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, 60)];
    [headerLblDesc setText:@"       Consultant Neuropsychiatrist, Sexologist, Drug De-addiction Specialist"];//Set text in label.
    headerLblDesc.lineBreakMode = UILineBreakModeWordWrap;// add this line
    headerLblDesc.numberOfLines = 0;
    headerLblDesc.textColor = [UIColor whiteColor];
    headerLblDesc.backgroundColor = [UIColor clearColor];
    headerLblDesc.font = [UIFont fontWithName:@"Futura-Medium" size:14.0f];
    headerLblDesc.textAlignment = NSTextAlignmentCenter;
    [headerLblDesc sizeToFit];
    [self.view addSubview:headerLblDesc];//A
    
    UIWebView *aWeb = [[UIWebView alloc] initWithFrame:CGRectMake(0, profileImg.frame.origin.y+profileImg.frame.size.height+120, self.view.frame.size.width, self.view.frame.size.height-170)];
    aWeb.delegate = self;
    aWeb.backgroundColor = [UIColor clearColor];
    NSMutableString *urlStr = [NSMutableString new];
    [urlStr appendFormat:@"<body style=\"font-family:Arial, Helvetica, sans-serif; line-height:20px; font-size:12px\">"];
    [urlStr appendFormat:@"<h1 style=\"font-size:18px; font-weight: bold; color:#666; margin:0 0 10px 0;\">"];
    
    //[urlStr appendString:@"Dr. Suvendu Narayan Mishra"];
    [urlStr appendString:@"</h1>\n"];
    
    [urlStr appendString:@"<h2 style=\"font-size:16px; color:#333; font-style: bold;  margin:5px 0;\">"];
    [urlStr appendString:@"<p>Dr. Suvendu Narayan Mishra is an eminent Psychiatrist from Bhubaneshwar with core skills in Neuropsychiatry, Sexology and Drug De-addiction disorders. Dr. Mishra is available for consultation at Sebika Medicine Store (Bhubaneshwar) and Gupta Variety Store (Jajpur) with a prior appointment.</p><p>On the academic front, Dr. Mishra holds MBBS, MD qualifications. Besides clinical practice, Dr. Mishra plays the vital role of a medical educator at IMS and SUM Hospital where he is an Assistant Professor.</p><p>Dr. Mishra's availability on Sundays at Gupta Variety Store is advantageous to patients who can thereby access his services all days of the week.</p>"];
    [urlStr appendString:@"<br/>"];
    [urlStr appendString:@"</h2>\n"];
    [aWeb loadHTMLString:urlStr baseURL:nil];
    [self.view addSubview:aWeb];
    
    activityIndicatior = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicatior setHidesWhenStopped:YES];
    activityIndicatior.center = self.view.center;
    [self.view addSubview:activityIndicatior];
    [activityIndicatior startAnimating];

}


#pragma mark webView deligate methods


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [activityIndicatior stopAnimating];

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
