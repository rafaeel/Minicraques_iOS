//
//  DetailsViewController.h
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Minicraque.h"
#import "Favorites.h"

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *nationalityLabel;
@property (strong, nonatomic) IBOutlet UIButton *favButton;

@property (strong, nonatomic) NSDictionary *parseDetail;
@property (strong, nonatomic) Minicraque *minicraque;
@property (strong, nonatomic) Favorites *favorites;

- (IBAction)favoriteButton:(id)sender;

@end
