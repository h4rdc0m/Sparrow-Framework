//
//  SPQuadTest.m
//  Sparrow
//
//  Created by Daniel Sperl on 23.04.09.
//  Copyright 2009 Incognitek. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

#import "SPMatrix.h"
#import "SPMakros.h"
#import "SPPoint.h"
#import "SPSprite.h"
#import "SPQuad.h"
#import <math.h>

// -------------------------------------------------------------------------------------------------

@interface SPQuadTest : SenTestCase 
{
}

@end

// -------------------------------------------------------------------------------------------------

@implementation SPQuadTest

- (void) setUp
{
}

- (void) tearDown
{
}

#pragma mark -

- (void)testProperties
{
    float width = 30.0f;
    float height = 20.0f;
    float x = 3;
    float y = 2;
    
    SPQuad *quad = [[SPQuad alloc] initWithWidth:width height:height];
    quad.x = x; 
    quad.y = y;
    
    STAssertTrue(SP_IS_FLOAT_EQUAL(x, quad.x), @"wrong x");
    STAssertTrue(SP_IS_FLOAT_EQUAL(y, quad.y), @"wrong y");
    STAssertTrue(SP_IS_FLOAT_EQUAL(width, quad.width), @"wrong width");
    STAssertTrue(SP_IS_FLOAT_EQUAL(height, quad.height), @"wrong height");
    
    [quad release];
}

- (void)testWidth
{
    float width = 30;
    float height = 40;
    float angle = SP_D2R(45.0f);
    SPQuad *quad = [[SPQuad alloc] initWithWidth:width height:height];
    quad.rotationZ = angle;

    float expectedWidth = cosf(angle) * (width + height);
    STAssertTrue(SP_IS_FLOAT_EQUAL(expectedWidth, quad.width), @"wrong width: %f", quad.width);
    
    [quad release];
}

@end