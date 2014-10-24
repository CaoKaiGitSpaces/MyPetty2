//
//  MessageModel.m
//  MyPetty
//
//  Created by miaocuilin on 14-10-17.
//  Copyright (c) 2014年 AidiGame. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.msg forKey:@"msg"];
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.usr_id forKey:@"usr_id"];
    [aCoder encodeObject:self.img_id forKey:@"img_id"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.msg = [aDecoder decodeObjectForKey:@"msg"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
        self.usr_id = [aDecoder decodeObjectForKey:@"usr_id"];
        self.img_id = [aDecoder decodeObjectForKey:@"img_id"];
    }
    return self;
}


-(void)dealloc
{
    [_msg release];
    [_time release];
    [_usr_id release];
    [_img_id release];
    [super dealloc];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
//    NSLog(@"undefinedKey:%@",key);
}
@end