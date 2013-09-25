//
//  ProfileViewController.h
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate,
                                                    UINavigationControllerDelegate,
                                                    UITextFieldDelegate>{
    UIImagePickerController *cameraPicker;
    UIImagePickerController *libraryPicker;
    UIImage *img;
}

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photoProfile;
@property (strong, nonatomic) IBOutlet UITextField *statusText;


@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *optionsView;

@property (strong, nonatomic) Profile *profile;

- (IBAction)editButton:(id)sender;
- (IBAction)takePhoto:(id)sender;
- (IBAction)choosePhoto:(id)sender;

@end
