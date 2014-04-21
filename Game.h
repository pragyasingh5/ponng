//
//  Game.h
//  pong
//
//  Created by Pragya Singh on 4/19/14.
//  Copyright (c) 2014 Pragya Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

int Y;
int X;
int ComputerScoreNumber;
int PlayerScoreNumber;


@interface Game : UIViewController
{
    IBOutlet UIImageView *Ball;
    IBOutlet UIButton *StartButton;
    IBOutlet UIImageView *Player;
    IBOutlet UIImageView *Computer;
    
    IBOutlet UILabel *PlayerScore;
    IBOutlet UILabel *ComputerScore;
    IBOutlet UILabel *WinOrLose;
    IBOutlet UIButton *Exit;
    
    
    NSTimer *timer;
}

- (IBAction)StartButton:(id)sender;
- (void)BallMovement;
- (void)ComputerMovement;
- (void)Collision;

@end
