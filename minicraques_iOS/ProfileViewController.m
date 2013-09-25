//
//  ProfileViewController.m
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import "ProfileViewController.h"
#import "EditProfileViewController.h"

@interface ProfileViewController ()
@property CGRect startPosition;
@end

@implementation ProfileViewController

@synthesize profile;
@synthesize nameLabel;
@synthesize usernameLabel;
@synthesize emailLabel;
@synthesize statusText;
@synthesize startPosition;

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
    
    profile = [[Profile alloc] init];
    nameLabel.text = profile.name;
    usernameLabel.text = profile.username;
    emailLabel.text = profile.email;
    statusText.text = profile.status;
    statusText.delegate = self;

    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(selectOption)];
    [singleTap setNumberOfTapsRequired:1];
    [self.photoProfile addGestureRecognizer:singleTap];
//    [singleTap release];
}

- (void)viewWillAppear:(BOOL)animated {
    nameLabel.text = profile.name;
    usernameLabel.text = profile.username;
    emailLabel.text = profile.email;
    statusText.text = profile.status;
}

- (void) selectOption {
    [self.view endEditing:YES];
    startPosition = CGRectMake(0, 570, 320, 520);
    
    [UIView animateWithDuration:0.4
                          delay:0.1
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         self.contentView.frame = CGRectMake(0, 0, 320, 520);
                     }
                     completion:^(BOOL finished){
                     }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissContentView:)];
    [self.contentView addGestureRecognizer:tap];
    [self.optionsView addGestureRecognizer:tap];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editButton:(id)sender {
    [self performSegueWithIdentifier:nil sender:self];
}

- (IBAction)takePhoto:(id)sender {
    cameraPicker = [[UIImagePickerController alloc] init];
    cameraPicker.delegate = self;
    [cameraPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:cameraPicker animated:YES completion:nil];
//    [cameraPicker release];
}

- (IBAction)choosePhoto:(id)sender {
    libraryPicker = [[UIImagePickerController alloc] init];
    libraryPicker.delegate = self;
    [libraryPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:libraryPicker animated:YES completion:nil];
//    [libraryPicker release];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    img = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.photoProfile setImage:img];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissContentView:(UITapGestureRecognizer *)gr {
    
    [UIView animateWithDuration:0.4
                          delay:0.1
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         self.contentView.frame = startPosition;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"editController"]){
        EditProfileViewController *epvc = [segue destinationViewController];
        epvc.profile = self.profile;
    }
}
- (void)dealloc {
//    [statusText release];
//    [super dealloc];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
