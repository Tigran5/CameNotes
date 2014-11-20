//
//  AddNotesViewController.m
//  CameraNotes
//
//  Created by Tigran Torgomyan on 8/28/14.
//  Copyright (c) 2014 Ogma Inc. All rights reserved.
//

#import "AddNotesViewController.h"


@interface AddNotesViewController () <UITextViewDelegate>

@property (strong, nonatomic) NSMutableArray *notes;
@property (weak, nonatomic) IBOutlet UITextView *addNotesTextView;

@end

@implementation AddNotesViewController

-(NSMutableArray *)notes {
    if(_notes == nil) {
        _notes = [NSMutableArray array];
    }
    return _notes;
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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSData *storedNotes = [[NSUserDefaults standardUserDefaults] objectForKey:kNotes];
    if(storedNotes) {
        self.notes = [NSKeyedUnarchiver unarchiveObjectWithData:storedNotes];
    }
    
    self.addNotesTextView.text = self.note.contents;
    self.addNotesTextView.delegate = self;
    self.addNotesTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [self.addNotesTextView becomeFirstResponder];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredContentSizeChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    [[self navigationController] setNavigationBarHidden:NO];
}

#pragma mark - 
#pragma mark - Done button
- (IBAction)doneButton:(id)sender {
    self.note.contents = self.addNotesTextView.text;
    
    [self.notes addObject:self.note];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.notes] forKey:kNotes];
    
    [self.delegate reloadModel];
    [self.delegate reloadView];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.addNotesTextView resignFirstResponder];
}

-(void)preferredContentSizeChanged:(NSNotification *)notification{
    self.addNotesTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
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
