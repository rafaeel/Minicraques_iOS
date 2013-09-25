//
//  EditProfileViewController.h
//  minicraques_iOS
//
//  Created by Rafael on 9/19/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "ProfileViewController.h"

@interface EditProfileViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) Profile *profile;
@property (strong, nonatomic) ProfileViewController *pvc;

@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *usernameText;
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *birthdayText;
@property (strong, nonatomic) IBOutlet UITextField *cellText;

@property (strong, nonatomic) IBOutlet UIButton *maleGenderButton;
- (IBAction)maleGender:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *femaleGenderButton;
- (IBAction)femaleGender:(id)sender;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIView *pickerContent;
- (IBAction)okButton:(id)sender;

- (IBAction)saveButton:(id)sender;

@end
