//
//  Profile.h
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject //<NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSData *imagePNGRepresentation;

- (id) initWithName:(NSString *)aName
           username:(NSString *)anUsername
              email:(NSString *)anEmail
             status:(NSString *)aStatus;

//+ (NSString *) getArchivePath;
//+ (void) saveProfile:(Profile *)aProfile;
//+ (Profile *) getProfile;

@end
