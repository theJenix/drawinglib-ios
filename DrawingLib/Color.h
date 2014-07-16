//
//  Color.h
//  DrawingLib
//
//  Created by Jesse Rosalia on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
#import <CoreGraphics/CGColor.h>

@interface Color : NSObject

-(CGColorRef)getCGColor;

@end

@interface RGBColor : Color {
@private
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    
}

//+(RGBColor *)colorWithRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue andAlpha:(CGFloat)alpha;
//
-(id)initWithRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue andAlpha:(CGFloat)alpha;

-(id)initWithInt32:(UInt32)int32;

@end

//populated in the RGBColor initialize method

#define kColorRed   ([[RGBColor alloc] initWithRed:1.0 andGreen:0.0 andBlue:0.0 andAlpha:1.0])
#define kColorGreen ([[RGBColor alloc] initWithRed:0.0 andGreen:1.0 andBlue:0.0 andAlpha:1.0])
#define kColorBlue  ([[RGBColor alloc] initWithRed:0.0 andGreen:0.0 andBlue:1.0 andAlpha:1.0])
#define kColorBlack ([[RGBColor alloc] initWithRed:0.0 andGreen:0.0 andBlue:0.0 andAlpha:1.0])
#define kColorWhite ([[RGBColor alloc] initWithRed:1.0 andGreen:1.0 andBlue:1.0 andAlpha:1.0])


//const Color *kColorRed;
//const Color *kColorBlue;
//const Color *kColorGreen;
//const Color *kColorBlack;
//const Color *kColorWhite;