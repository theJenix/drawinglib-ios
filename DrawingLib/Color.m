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

-(id)initWithRed:(CGFloat)r andGreen:(CGFloat)g andBlue:(CGFloat)b andAlpha:(CGFloat)a {
    self->red = r;
    self->blue = b;
    self->green = g;
    self->alpha = a;
    return self;
}

-(id)initWithInt32:(UInt32)int32 {
    self->red   = (CGFloat)((int32 >> 16) & 0xFF)/255.0f;
    self->green = (CGFloat)((int32 >>  8) & 0xFF)/255.0f;
    self->blue  = (CGFloat)((int32      ) & 0xFF)/255.0f;
    self->alpha = (CGFloat)((int32 >> 24) & 0xFF)/255.0f;
    return self;
}

@end
