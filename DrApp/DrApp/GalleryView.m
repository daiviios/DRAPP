//
//  GalleryView.m
//  DrApp
//
//  Created by Nallasivakumar C on 28/06/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "GalleryView.h"

@implementation GalleryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)imageView :(UIImage *)img
{
    
    
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width-20, self.frame.size.height - 60)];
    [imgView setImage:img];
    [imgView setAdjustsImageSizeForAccessibilityContentSizeCategory:YES];
    imgView.center = [self convertPoint:self.center fromView:self.superview];
    [self addSubview:imgView];
    
    

    UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(self.frame.size.width-50, 0, 50, 50);
    [closeBtn setImage:[UIImage imageNamed:@"closebtn.png"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
}



-(void)closeBtnClick
{
    [self removeFromSuperview];
}

@end
