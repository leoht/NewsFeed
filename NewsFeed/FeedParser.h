//
//  FeedParser.h
//  NewsFeed
//
//  Created by HETSCH Leonard on 28/03/14.
//  Copyright (c) 2014 Gobelins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Article.h"

@interface FeedParser : NSObject <NSXMLParserDelegate> {
    NSMutableString *currentElementValue;
    Article *currentArticle;
    BOOL inFeed;
}

@property (strong, nonatomic) NSMutableArray *articles;

- (void) parseFeedFromUrl:(NSString *)url;

@end
