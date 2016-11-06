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
        for (Dice* dice in self.dices) {
            [dice randomize];
        }
        NSMutableSet * heldDices = [[NSMutableSet alloc]init];
        self.heldDices = heldDices;
    }
    return self;
}

-(NSString *) getInput: type {
    char input [255];
    NSString * stringInput;
    if ([type isEqualToString:@"num"]) {
        do {
            fgets(input, 255, stdin);
            stringInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
            stringInput = [stringInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if ([stringInput intValue] <= 0) {
                NSLog(@"Please enter a valid number between 1 and 5");
            }
        } while ([stringInput integerValue] <= 0 || [stringInput integerValue] > 5);
    }
    if ([type isEqualToString:@"option"]) {
        do {
            fgets(input, 255, stdin);
            stringInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
            stringInput = [stringInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if ([stringInput isNotEqualTo:@"roll"] && [stringInput isNotEqualTo:@"hold"] && [stringInput isNotEqualTo:@"reset"]) {
                NSLog(@"Please enter a valid option.");
            }
        } while ([stringInput isNotEqualTo:@"roll"] && [stringInput isNotEqualTo:@"hold"] && [stringInput isNotEqualTo:@"reset"]);
    }
    return stringInput;
}

-(void) roll {
    for (Dice* dice in self.dices) {
        if (![self.heldDices containsObject:dice]) {
            [dice randomize];
        }
    }
}

-(void) holdDice: (int) diceNumber{
    diceNumber = diceNumber -1;
    if ([self.heldDices containsObject:self.dices[diceNumber]]) {
        [self.heldDices removeObject: self.dices[diceNumber] ];
    }else{
        [self.heldDices addObject: self.dices[diceNumber] ];
    }
    self.heldTotal = 0;
    int  counter = 1;
    for (Dice* dice in self.dices) {
        if ([self.heldDices containsObject:dice]){
            self.heldTotal += dice.currentValue;
        }
        counter += 1;
    }
}

-(void) resetDice {
    for (Dice * dice in self.dices) {
        [self.heldDices removeObject:dice];
    }
}

-(void) currentStatus {
    int  counter = 1;
    for (Dice* dice in self.dices) {
        if ([self.heldDices containsObject:dice]){
            NSLog(@"Dice %d: [%d]",counter, dice.currentValue);
        }else{
            NSLog(@"Dice %d: %d",counter, dice.currentValue);
        }
        counter += 1;
    }
    NSLog(@"Total: %ld", (long)self.heldTotal);
}

@end
