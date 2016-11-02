//
//  GameController.h
//  Threelow
//
//  Created by Erin Luu on 2016-11-02.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property NSArray * dices;
@property NSMutableSet * heldDices;

-(void) roll;
-(void) holdDice: (int) diceNumber;
@end
