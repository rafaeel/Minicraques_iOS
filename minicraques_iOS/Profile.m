//
//  Profile.m
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import "Profile.h"

@implementation Profile

- (id) init {
    self = [self initWithName:@"Your name here"
                     username:@"Your username here"
                        email:@"Your email here"
                       status:@"Your status here"];
    return self;
}

- (id) initWithName:(NSString *)aName
           username:(NSString *)anUsername
              email:(NSString *)anEmail
             status:(NSString *)aStatus
{
    self = [super init];
    
    if(self){
        self.name = aName;
        self.username = anUsername;
        self.email = anEmail;
        self.status = aStatus;
    }
    
    return self;
}

//- (void) encodeWithCoder:(NSCoder *)anEncoder{
//    [anEncoder encodeObject:self.name forKey:@"name"];
//    [anEncoder encodeObject:self.username forKey:@"username"];
//    [anEncoder encodeObject:self.email forKey:@"email"];
//    [anEncoder encodeObject:self.status forKey:@"status"];
//    [anEncoder encodeObject:self.imagePNGRepresentation forKey:@"photoProfile"];
//}
//
//- (Profile *) initWithCoder:(NSCoder *)aDecoder{
//    self = [super init];
//    if (self) {
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        self.username = [aDecoder decodeObjectForKey:@"username"];
//        self.email = [aDecoder decodeObjectForKey:@"email"];
//        self.status = [aDecoder decodeObjectForKey:@"status"];
//        self.imagePNGRepresentation = [aDecoder decodeObjectForKey:@"photoProfile"];
//    }
//    return self;
//}
//
//+ (NSString *)getArchivePath {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
//    NSString *docsDir = [paths objectAtIndex:0];
//    return [docsDir stringByAppendingPathComponent:@"profile.model"];
//}
//
//+ (void)saveProfile:(Profile *)aProfile {
//    [NSKeyedArchiver archiveRootObject:aProfile toFile:[Profile getArchivePath]];
//}
//
//+ (Profile *) getProfile {
//    return [NSKeyedUnarchiver unarchiveObjectWithFile:[Profile getArchivePath]];
//}

@end
