//
//  XMLParser.m
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "LeitorRSSAppDelegate.h"
#import "FeedPosts.h"
#import "XMLParser.h"
#import "Urls.h"

@implementation XMLParser

@synthesize urlFeed, itemElementInProgress, channelElementInProgress;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithUrlFeed:(NSString *)url
{
    if (self == [super init])
    {
        LeitorRSSAppDelegate *appDelegate = (LeitorRSSAppDelegate *)[[UIApplication sharedApplication] delegate];
        moc = appDelegate.managedObjectContext;
        urlFeed = url;
        items = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{ 
    if ([elementName isEqualToString:@"channel"]) 
    {
        [self setChannelElementInProgress:YES];
    }
    
    if ([elementName isEqualToString:@"item"]) 
    {
        [self setChannelElementInProgress:NO];
        [self setItemElementInProgress:YES];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(!dadoAtual)
    {
        dadoAtual = [[NSMutableString alloc] init];
    }
    
    [dadoAtual appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (self.channelElementInProgress)
    {
        if ([elementName isEqualToString:@"title"])
        {
            nomeFeed = [dadoAtual stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
    
        if ([elementName isEqualToString:@"item"])
        {
            [self setItemElementInProgress:NO];
            FeedPosts *feedP = [[FeedPosts alloc]initWithTitulo:tempTitulo conteudo:tempConteudo pubData:tempPubData guid:tempGuid];
            [items addObject:feedP];
            [feedP release];
        }
    }
    
    if (self.itemElementInProgress)
    { 
        if ([elementName isEqualToString:@"title"])
        {
            tempTitulo = [dadoAtual stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        
        if ([elementName isEqualToString:@"pubDate"])
        {
            tempPubData = [dadoAtual stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        
        if ([elementName isEqualToString:@"description"])
        {
            tempConteudo = [dadoAtual stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        
        if ([elementName isEqualToString:@"guid"])
        {
            tempGuid = [dadoAtual stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
    }
    
    NSError *error;
    
    if ([elementName isEqualToString:@"rss"])
    {
        NSEntityDescription *entCheckUrl = [NSEntityDescription entityForName:@"Urls" inManagedObjectContext:moc];
        NSFetchRequest *reqCheckUrl = [[NSFetchRequest alloc] init];
        [reqCheckUrl setEntity:entCheckUrl];
        NSPredicate *predCheckUrl = [NSPredicate predicateWithFormat:@"url == %@",urlFeed];
        
        [reqCheckUrl setPredicate:predCheckUrl];
        NSMutableArray *arrayCheckUrl = [[moc executeFetchRequest:reqCheckUrl error: &error] mutableCopy];  
        
        [reqCheckUrl release];
        
        if ([arrayCheckUrl count] == 0)
        {
            Urls *entUrls = (Urls *)[NSEntityDescription insertNewObjectForEntityForName:@"Urls" inManagedObjectContext:moc];
            [entUrls setNome:nomeFeed];
            [entUrls setUrl:urlFeed];
            if(![moc save: &error]){  
            } 
        }
    }
    
    
}

-(BOOL)parse
{
    NSURL *url = [[NSURL alloc] initWithString:[self urlFeed]];

    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];

    [parser parse];

    [url release];
    [parser setDelegate:nil];
    [parser release];

    return YES;   
}


-(void)dealloc
{
    [dadoAtual release];
    [urlFeed release];
    [super dealloc];
}

@end
