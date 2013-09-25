//
//  FavoriteDetailViewController.m
//  minicraques_iOS
//
//  Created by Rafael on 9/25/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import "FavoriteDetailViewController.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@interface FavoriteDetailViewController ()

@end

@implementation FavoriteDetailViewController

@synthesize parseDetail;
@synthesize imageView;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.nameLabel.text = [self.parseDetail objectForKey:@"name"];
    self.nationalityLabel.text = [self.parseDetail objectForKey:@"nationality"];
    
    NSString *formatURL = [NSString stringWithFormat:@"http://127.0.0.1:3000%@",
                 [self.parseDetail objectForKey:@"photo_url"]];
    NSURL *url = [NSURL URLWithString:formatURL];
    
    NSData *parsePhoto = [NSData dataWithContentsOfURL:url];
    imageView.image = [UIImage imageWithData:parsePhoto];
}

//- (IBAction)unfavoriteButton:(id)sender{

//    NSLog(@"%@", [self.parseDetail objectForKey:@"id"]);
    //    NSString *imageRep = [UIImagePNGRepresentation(imageView.image) base64Encoding];
    
    //    NSLog(@"%@", imageRep);
//    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:minicraque.name, @"name",
//                                minicraque.nationality, @"nationality",
//                                imageRep, @"photo_data", nil];
//    NSError *error;
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:kNilOptions error:&error];
//    NSURL *url = [[NSURL alloc] initWithString:@"http://127.0.0.1:3000/favoritos.json"];
//    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
//    
//    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:@"/favoritos" parameters:parameters];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[NSString stringWithFormat:@"%d", [postData length]] forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPBody:postData];
//    
//    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//        UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Minicraques :D" message:@"Favoritado!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [successAlert show];
//        [sender removeFromSuperview];
//        //        [self.tabBarController.tabBar.items[2] setBadgeValue:[NSString stringWithFormat:@"%i", self.favorites.favoritesMinicraques.count]];
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
//        NSLog(@"[Error]: (%@ %@) %@", [request HTTPMethod], [[request URL] relativePath], error);
//    }];
//    
//    [operation start];
//}

- (IBAction)unfavoriteButton:(id)sender {
    NSLog(@"%@", [self.parseDetail description]);
    NSLog(@"%@", [self.parseDetail objectForKey:@"id"]);
    
    NSString *urlFormated = [NSString stringWithFormat:@"http://127.0.0.1:3000/favoritos/%@.json",
                             [self.parseDetail objectForKey:@"id"]];
    NSURL *url = [[NSURL alloc] initWithString:urlFormated];
    NSLog(@"%@", url);
    NSString *pathFormated = [NSString stringWithFormat:@"/favoritos/%@", [self.parseDetail objectForKey:@"id"]];
    NSLog(@"%@", pathFormated);
    
    
    NSString *httpVerb = @"DELETE";
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:httpVerb path:pathFormated parameters:nil];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Minicraques :D" message:@"Desfavoritado!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [successAlert show];
        [sender removeFromSuperview];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        NSLog(@"[Error]: (%@ %@) %@", [request HTTPMethod], [[request URL] relativePath], error);
    }];
    
    [operation start];
    
}
@end
