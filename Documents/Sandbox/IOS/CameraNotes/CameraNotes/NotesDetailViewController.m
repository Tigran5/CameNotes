//
//  NotesDetailViewController.m
//  CameraNotes
//
//  Created by Tigran Torgomyan on 8/28/14.
//  Copyright (c) 2014 Ogma Inc. All rights reserved.
//

#import "NotesDetailViewController.h"
#import "Note.h"


@interface NotesDetailViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *notesTextView;

@end

@implementation NotesDetailViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.notesTextView.text = self.note.contents;
    self.notesTextView.delegate = self;
    self.notesTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredContentSizeChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    [[self navigationController] setNavigationBarHidden:NO];
}

-(void)preferredContentSizeChanged:(NSNotification *)notification{
    self.notesTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    self.note.contents = textView.text;
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
