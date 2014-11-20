//
//  CameraNotesViewController.m
//  CameraNotes
//
//  Created by Tigran Torgomyan on 8/27/14.
//  Copyright (c) 2014 Ogma Inc. All rights reserved.
//

#import "CameraNotesViewController.h"

@interface CameraNotesViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;


@end

@implementation CameraNotesViewController

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
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NO Camera" message:@"There is no camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    [[self navigationController] setNavigationBarHidden:NO];
}

- (IBAction)takePhoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagepiccker = [[UIImagePickerController alloc] init];
        imagepiccker.delegate = self;
        imagepiccker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagepiccker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagepiccker.allowsEditing = NO;
        [self presentViewController:self animated:YES completion:nil];
        self.newMedia = YES;
    }
    
}



#pragma mark -
#pragma mark - UIImagePicker delgete
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *media = info[UIImagePickerControllerMediaType];
   // [picker dismissViewControllerAnimated:self completion:nil];
    
    if ([media isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        self.ImageView.image = image;
        if (self.newMedia) {
           UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:finishedSavingWithError:conrextInfo:), nil);
        }
    }
}

-(void)image:(UIImage *)image finishedSavingWithError:(NSError *)error conrextInfo:(void*)contextInfo{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Faild to save image" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
    }

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
