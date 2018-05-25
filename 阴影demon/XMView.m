
//
//  XMView.m
//  阴影demon
//
//  Created by 吴俊明 on 2018/5/22.
//  Copyright © 2018年 吴俊明. All rights reserved.
//

#import "XMView.h"

@implementation XMView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
#pragma mark - 绘制内阴影 -
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.5];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = UIColor.blackColor;
    shadow.shadowOffset = CGSizeMake(3, 3);
    shadow.shadowBlurRadius = 20;
    NSShadow *shadow2 = [[NSShadow alloc] init];
    shadow2.shadowColor = UIColor.blackColor;
    shadow2.shadowOffset = CGSizeMake(0, 0);
    shadow2.shadowBlurRadius = 20;
    
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 150, 200)];
    [color setFill];
    [rectanglePath fill];
    
//    CGContextStrokePath(context);
    CGContextSaveGState(context);
    CGContextClipToRect(context, rectanglePath.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow2.shadowColor CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor *opaqueShadow = [shadow2.shadowColor colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadow2.shadowOffset, shadow2.shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [rectanglePath fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    
    UIBezierPath *starPath = [UIBezierPath bezierPath];
    [color setFill];
    [starPath fill];
    
    CGContextSaveGState(context);
    CGContextClipToRect(context, starPath.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow.shadowColor CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [shadow.shadowColor colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [starPath fill];
        
        CGContextEndTransparencyLayer(context);
//        CGContextStrokePath(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
//    CGContextStrokePath(context);
}
@end
