//
//  Game.m
//  pong
//
//  Created by Pragya Singh on 4/19/14.
//  Copyright (c) 2014 Pragya Singh. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)Collision
{
    if(CGRectIntersectsRect(Ball.frame, Player.frame))
    {
        Y = arc4random() %5;
        Y = 0- Y;
    }
    
    if(CGRectIntersectsRect(Ball.frame, Computer.frame))
    {
        Y = arc4random() %5;
    }
    
    
}





-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *Drag = [[event allTouches] anyObject];
    Player.center = [Drag locationInView:self.view];

    if(Player.center.y > 521)
    {
        Player.center =CGPointMake(Player.center.x, 521);
    }
    
    if(Player.center.y < 521)
    {
        Player.center =CGPointMake(Player.center.x, 521);
    }
    
    if(Player.center.x < 1)
    {
        Player.center = CGPointMake(1, Player.center.y);
    }
    
    if(Player.center.x > 260)
    {
        Player.center = CGPointMake(245, Player.center.y);
    }
}


-(void)ComputerMovement
{
    if(Computer.center.x > Ball.center.x)
    {
        Computer.center = CGPointMake(Computer.center.x - 2, Computer.center.y);
    }
    
    if(Computer.center.x < Ball.center.x)
    {
        Computer.center = CGPointMake(Computer.center.x + 2, Computer.center.y);
    }
    
    if(Computer.center.x < 3)
    {
        Computer.center = CGPointMake(1, Computer.center.y);
    }
    
    if(Computer.center.x > 260)
    {
        Computer.center = CGPointMake(245, Computer.center.y);
    }
}

- (IBAction)StartButton:(id)sender
{
    StartButton.hidden = YES;
    Exit.hidden = YES;
    Y = arc4random() %11;
    Y = Y - 5;
    
    X = arc4random() %11;
    X = X - 5;
    
    if ( Y == 0)
    {
        Y = 1;
    }
    if ( X == 0)
    {
        X = 1;
    }

    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BallMovement) userInfo:nil repeats:YES];
}

- (void)BallMovement
{
    [self ComputerMovement];
    [self Collision];
    
    Ball.center = CGPointMake(Ball.center.x + X, Ball.center.y + Y);
    
    if (Ball.center.x < 15)
    {
        X = 0 - X;
    }
  
    if (Ball.center.x > 305)
    {
        X = 0 - X;
    }
    
    if (Ball.center.y < 0)
    {
        PlayerScoreNumber = PlayerScoreNumber + 1;
        PlayerScore.text = [NSString stringWithFormat:@"%i", PlayerScoreNumber];
        
        [timer invalidate];
        StartButton.hidden = NO;
        
        Ball.center = CGPointMake(145, 271);
        Computer.center = CGPointMake(123, 20);
        
        if(PlayerScoreNumber == 3)
        {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"You Win!"];
        }
        
    }
    
    if (Ball.center.y >569)
    {
        ComputerScoreNumber = ComputerScoreNumber + 1;
        ComputerScore.text = [NSString stringWithFormat:@"%i", ComputerScoreNumber];
        StartButton.hidden = NO;
        Ball.center = CGPointMake(145, 271);
        Computer.center = CGPointMake(123, 20);
        
        if(ComputerScoreNumber == 3)
        {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"You Lose!"];
            
        }
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    PlayerScoreNumber = 0;
    ComputerScoreNumber = 0;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
