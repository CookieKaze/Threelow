//
//  GameController.m
//  Threelow
//
//  Created by Erin Luu on 2016-11-02.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        Dice * dice1 = [[Dice alloc]init];
        Dice * dice2 = [[Dice alloc]init];
        Dice * dice3 = [[Dice alloc]init];
        Dice * dice4 = [[Dice alloc]init];
        Dice * dice5 = [[Dice alloc]init];
        self.dices = @[dice1, dice2, dice3, dice4, dice5];
        int  counter = 1;
        for (Dice* dice in self.dices) {
            [dice randomize];
            NSLog(@"Dice %d: %d",counter, dice.currentValue);
            counter += 1;
        }
        NSMutableSet * heldDices = [[NSMutableSet alloc]init];
        self.heldDices = heldDices;
    }
    return self;
}

-(void) roll {
    for (Dice* dice in self.dices) {
        [dice randomize];
        if ([self.heldDices containsObject:dice]){
            NSLog(@"[%d]",dice.currentValue);
        }else{
            NSLog(@"%d",dice.currentValue);
        }

    }
}

-(void) holdDice: (int) diceNumber{
    diceNumber = diceNumber -1;
    [self.heldDices addObject: self.dices[diceNumber] ];
    int  counter = 1;
    for (Dice* dice in self.dices) {
        if ([self.heldDices containsObject:dice]){
            NSLog(@"Dice %d: [%d]",counter, dice.currentValue);
        }else{
            NSLog(@"Dice %d: %d",counter, dice.currentValue);
        }
        counter += 1;
        
    }
}

-(void) unholdDice: (int) diceNumber{
    diceNumber = diceNumber -1;
    [self.heldDices removeObject: self.dices[diceNumber] ];
    int  counter = 1;
    for (Dice* dice in self.dices) {
        if ([self.heldDices containsObject:dice]){
            NSLog(@"Dice %d: [%d]",counter, dice.currentValue);
        }else{
            NSLog(@"Dice %d: %d",counter, dice.currentValue);
        }
        counter += 1;
        
    }
}
@end
