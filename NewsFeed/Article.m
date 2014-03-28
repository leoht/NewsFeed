//
//  Article.m
//  NewsFeed
//
//  Created by HETSCH Leonard on 28/03/14.
//  Copyright (c) 2014 Gobelins. All rights reserved.
//

#import "Article.h"

@implementation Article

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@", self.title, self.link];
}

@end
