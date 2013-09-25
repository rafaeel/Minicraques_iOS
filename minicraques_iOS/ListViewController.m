//
//  ListViewController.m
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import "ListViewController.h"
#import "DetailsViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

@synthesize tableInflate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.minicraque = [[Minicraque alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataRetrieved)
                                                 name:@"initWithJSONFinishedLoading"
                                               object:nil];
}

- (void) dataRetrieved {
    NSLog(@"DATA RETRIEVED METHOD");
    tableInflate = [[NSArray alloc] initWithArray:self.minicraque.minicraques];
    NSLog(@"TABLE INFLATE = %@", tableInflate);
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"NUMBER OF ROWS = %i", self.minicraque.minicraques.count);
    return self.minicraque.minicraques.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[tableInflate objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    DetailsViewController *dvc = [[DetailsViewController alloc] init];
//    dvc.parseDetail = [self.tableInflate objectAtIndex:indexPath.row];
//    
//    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"pushFromCraques"]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        DetailsViewController *dvc = [segue destinationViewController];
        dvc.parseDetail = [self.tableInflate objectAtIndex:indexPath.row];
    }
}

@end
