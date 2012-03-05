//
//  Color.m
//  DrawingLib
//
//  Created by Jesse Rosalia on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Color.h"

@implementation Color

-(CGColorRef) getCGColor {
    return nil;    
}

@end

@implementation RGBColor

/* Create a CGColor object from this RGB color
   NOTE: it is the callers job to call CGColorRelease on this object.
 */
-(CGColorRef) getCGColor {
    //create the RGB colorspace
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    //put our components in a CGFloat array
    CGFloat components[] = {red, green, blue, alpha};
    
    //create the RGB color
    CGColorRef color = CGColorCreate(colorspace, components);
    
    //and release the color space (we dont need it any more)
    CGColorSpaceRelease(colorspace);
    return color;
}


+(RGBColor *)initWithRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue andAlpha:(CGFloat)alpha {
    RGBColor *color = [RGBColor alloc];
    color->red   = red;
    color->green = green;
    color->blue  = blue;
    color->alpha = alpha;
    return color;
}
@end
