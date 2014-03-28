//
//  FeedParser.m
//  NewsFeed
//
//  Created by HETSCH Leonard on 28/03/14.
//  Copyright (c) 2014 Gobelins. All rights reserved.
//

#import "FeedParser.h"

@implementation FeedParser

- (id)init {
    self = [super init];
    self.articles = [[NSMutableArray alloc] init];
    return self;
}

- (void)parseFeedFromUrl:(NSURL *)url {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    parser.delegate = self;
    BOOL success = [parser parse];
    
    if (!success) {
        NSLog(@"Erreur");
    }
}

#pragma mark - NSXmlParserDelegate methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    // did we hit a RSS item ?
    if ([elementName isEqualToString:@"item"]) {
        inFeed = true;
        currentArticle = [[Article alloc] init];
        NSLog(@"New article object created");
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    // if we are in items feed we parse other elements
    if (inFeed) {
        if ([elementName isEqualToString:@"title"]) {
            currentArticle.title = currentElementValue;
        }
        if ([elementName isEqualToString:@"link"]) {
            currentArticle.link = currentElementValue;
        }
        if ([elementName isEqualToString:@"description"]) {
            currentArticle.description = currentElementValue;
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentElementValue) {
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else {
        [currentElementValue appendString:string];
    }
}

@end
