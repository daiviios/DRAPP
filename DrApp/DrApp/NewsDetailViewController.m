//
//  NewsDetailViewController.m
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"News";

    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-60)];
    self.view.backgroundColor = [UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];

    UIWebView *aWeb = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    aWeb.delegate = self;
    aWeb.backgroundColor = [UIColor clearColor];
    NSMutableString *urlStr = [NSMutableString new];
    [urlStr appendFormat:@"<body style=\"font-family:Arial, Helvetica, sans-serif; line-height:20px; font-size:12px\">"];
    [urlStr appendFormat:@"<h1 style=\"font-size:18px; font-weight: bold; color:#666; margin:0 0 10px 0;\">"];
    
    [urlStr appendString:@"Headline News"];
    [urlStr appendString:@"</h1>\n"];
    
    [urlStr appendString:@"<h2 style=\"font-size:16px; color:#333; font-style: bold;  margin:5px 0;\">"];
    [urlStr appendString:@"You identify subtle uses of language features.You pick up on multiple and subtle effects that these language features create.You comment on how these features effect the overall reading of the quotation.You identify subtle uses of language features.You pick up on multiple and subtle effects that these language features create.You comment on how these features effect the overall reading of the quotation.You identify subtle uses of language features.You pick up on multiple and subtle effects that these language features create.You comment on how these features effect the overall reading of the quotation.You identify subtle uses of language features.You pick up on multiple and subtle effects that these language features create.You comment on how these features effect the overall reading of the quotation.You identify subtle uses of language features.You pick up on multiple and subtle effects that these language features create.You comment on how these features effect the overall reading of the quotation.You identify subtle uses of language features.You pick up on multiple and subtle effects that these language features create.You comment on how these features effect the overall reading of the quotation.You identify subtle uses of language features.You pick up on multiple and subtle effects that these language features create.You comment on how these features effect the overall reading of the quotation.You identify subtle uses of language features.You pick up on multiple and subtle effects that these language features create."];
    [urlStr appendString:@"<br/>"];
    [urlStr appendString:@"</h2>\n"];
    [aWeb loadHTMLString:urlStr baseURL:nil];
    [self.view addSubview:aWeb];
}


#pragma mark webView deligate methods


- (void)webViewDidStartLoad:(UIWebView *)webView
{
   
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
 
    
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
