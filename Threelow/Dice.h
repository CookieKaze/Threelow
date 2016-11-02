//
//  Dice.h
//  Threelow
//
//  Created by Erin Luu on 2016-11-02.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property NSArray * diceFaces;
@property NSString * diceFace;
@property int currentValue;


- (void) randomize;

@end
