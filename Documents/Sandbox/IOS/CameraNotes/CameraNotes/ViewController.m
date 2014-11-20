//
//  ViewController.m
//  CameraNotes
//
//  Created by Tigran Torgomyan on 8/27/14.
//  Copyright (c) 2014 Ogma Inc. All rights reserved.
//

#import "ViewController.h"
#import "ILTranslucentView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *notesButton;
@property (weak, nonatomic) IBOutlet UIButton *cameraNotesButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *notesConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *camNotesConstraint;
@property (weak, nonatomic) IBOutlet UIView *containerView;



@end

@implementation ViewController

- (IBAction)notesButton:(id)sender {
   // [self performSegueWithIdentifier:@"NotesSegue" sender:self];
}

- (IBAction)camNotesButton:(id)sender {
   // [self performSegueWithIdentifier:@"CameraNoteSegue" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.notesButton.autoresizingMask = NO;
    self.cameraNotesButton.autoresizingMask = NO;
    [[self navigationController] setNavigationBarHidden:YES];
    self.containerView.backgroundColor = [UIColor clearColor];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self buttonAnimation];
    [[self navigationController] setNavigationBarHidden:YES];
}

#pragma mark -
#pragma mark - Buttons animation
-(void)buttonAnimation{
 [UIView animateWithDuration:1 delay:0.2 usingSpringWithDamping:0.9 initialSpringVelocity:1 options:0 animations:^{
     self.notesConstraint.constant = 121;
     self.camNotesConstraint.constant = 89;
     [self.view layoutIfNeeded];
 } completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
