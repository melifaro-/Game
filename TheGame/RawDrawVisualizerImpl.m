//
//  RawDrawVisualizerImpl.m
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "RawDrawVisualizerImpl.h"

@interface RawDrawVisualizerImpl()

- (void)setBlackImageToView:(UIImageView*)view;

@end

@implementation RawDrawVisualizerImpl

- (void)drawText:(NSString*)text onColor:(ColorType)color atPositionImpl:(Position)p
{
    //calculate drawing frame for the position
    
    CGRect drawingRect = CGRectZero;
    
    drawingRect.origin.x = _view.frame.size.width * p.x / FIELD_WIDTH;
    drawingRect.origin.y = _view.frame.size.height * p.y / FIELD_HEIGHT;
    drawingRect.size.width = _view.frame.size.width / FIELD_WIDTH;
    drawingRect.size.height = _view.frame.size.height / FIELD_HEIGHT;
    
    UIGraphicsBeginImageContextWithOptions(_view.frame.size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [_view.image drawInRect:_view.bounds];
    
    // First fill the background with white.
    switch (color) {
        case EmptyColor:
            CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
            break;
        case RedColor:
            CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
            break;
        case WhiteColor:
            CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
            break;
            
        default:
            break;
    }
    
    CGContextFillRect(context, drawingRect);
    
    if (color != EmptyColor)
    {
        CGContextStrokeRectWithWidth(context, drawingRect, 1);
        
        CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
        CGContextSelectFont(context, // 3
                             "Helvetica-Bold",
                             10,
                             kCGEncodingMacRoman);
        
        CGContextSetCharacterSpacing(context, 10); // 4
        CGContextSetTextDrawingMode(context, kCGTextFill);
        
        [text drawInRect:drawingRect withFont:[UIFont systemFontOfSize:20] lineBreakMode:NSLineBreakByCharWrapping alignment:NSTextAlignmentCenter];
    }
    
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [_view setImage:backgroundImage];
}

- (void)assignUI:(UIImageView*)view
{
    _view = view;
    
    [self setBlackImageToView:_view];
}

- (void)setBlackImageToView:(UIImageView*)view
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
    
    CGContextFillRect(context, view.bounds);
    
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [view setImage:backgroundImage];
}

@end
