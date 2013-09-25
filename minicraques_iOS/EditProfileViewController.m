//
//  EditProfileViewController.m
//  minicraques_iOS
//
//  Created by Rafael on 9/19/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import "EditProfileViewController.h"
#import "ProfileViewController.h"

@interface EditProfileViewController (){
    BOOL maleGender;
}

@end

@implementation EditProfileViewController

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
    
    self.nameText.delegate = self;
    self.usernameText.delegate = self;
    self.emailText.delegate = self;
    self.cellText.delegate = self;
    
    self.birthdayText.delegate =self;
    self.datePicker.maximumDate = [NSDate date];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectBirthday)];
    [singleTap setNumberOfTapsRequired:1];
    [self.birthdayText addGestureRecognizer:singleTap];
//    [singleTap release];
}

-(void)viewWillAppear:(BOOL)animated{
    self.nameText.text = self.profile.name;
    self.usernameText.text = self.profile.username;
    self.emailText.text = self.profile.email;
}

- (void) selectBirthday {
    [self.view endEditing:YES];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.pickerContent.frame = CGRectMake(0,293,320,226);
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
//    [_nameText release];
//    [_usernameText release];
//    [_emailText release];
//    [_birthdayText release];
//    [_cellText release];
//    [_pickerContent release];
//    [_datePicker release];
//    [_maleGenderButton release];
//    [_femaleGenderButton release];
//    [super dealloc];
}

- (IBAction)saveButton:(id)sender {
    self.profile.name = self.nameText.text;
    self.profile.username = self.usernameText.text;
    self.profile.email = self.emailText.text;
    
    self.pvc = [[ProfileViewController alloc] init];
    self.pvc.profile = self.profile;
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)okButton:(id)sender {
    NSDate *pickerDate = [self.datePicker date];
    NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];
    [formatDate setDateFormat:@"dd'/'MM'/'yyyy"];
    
    self.birthdayText.text = [formatDate stringFromDate:pickerDate];
    [self dismissDatePicker];
}

- (void) dismissDatePicker {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.pickerContent.frame = CGRectMake(0,570,320,226);
    [UIView commitAnimations];
}

- (IBAction)maleGender:(id)sender {
    maleGender = true;
    
    [self.maleGenderButton setTitleColor:[UIColor colorWithRed:105/255.0 green:0.0 blue:0.0 alpha:1.0] forState:UIControlStateNormal];
    [self.femaleGenderButton setTitleColor:[UIColor colorWithRed:50/255.0 green:79/255.0 blue:133/255.0 alpha:1.0] forState:UIControlStateNormal];
    NSLog(maleGender ? @"MALE" : @"FEMALE");
}

- (IBAction)femaleGender:(id)sender {
    maleGender = false;
    
    [self.maleGenderButton setTitleColor:[UIColor colorWithRed:50/255.0 green:79/255.0 blue:133/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.femaleGenderButton setTitleColor:[UIColor colorWithRed:105/255.0 green:0.0 blue:0.0 alpha:1.0] forState:UIControlStateNormal];
    NSLog(maleGender ? @"MALE" : @"FEMALE");
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSString *text = self.birthdayText.text;
    [self dismissDatePicker];
    self.birthdayText.text = text;
    [self.view endEditing:YES];
}
@end
