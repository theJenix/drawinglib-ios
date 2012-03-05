//
//  Circle.m
//  DrawingLib
//
//  Created by Jesse Rosalia on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Circle.h"

@implementation Circle

#pragma mark - Drawing

@synthesize center, color, radius;

+(Circle *)circleWithCenter:(CGPoint)center andRadius:(double)radius andColor:(Color *)color {
    Circle *circle = [Circle alloc];
    circle.center = center;
    circle.radius = radius;
    circle.color  = color;
    return circle;
}

-(void) draw:(CGContextRef)context into:(CGRect) rect {
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGRect rectangle = CGRectMake(center.x-radius,center.y-radius,radius,radius);
    
    CGContextAddEllipseInRect(context, rectangle);
    
    CGContextFillEllipseInRect(context, rectangle);
    
    CGContextStrokePath(context);
}

@end
