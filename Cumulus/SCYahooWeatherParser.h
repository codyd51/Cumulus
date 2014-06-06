
#import <Foundation/Foundation.h>
#import "SCWeather.h"

@class SCYahooWeatherParser;

@protocol SCYahooWeatherParserDelegate
- (void)yahooWeatherParser:(SCYahooWeatherParser *)parser recievedWeatherInformation:(SCWeather *)weather;
@end

typedef void(^SCYahooWeatherInfoBlock)(SCYahooWeatherParser *parser, SCWeather *weather);


@interface SCYahooWeatherParser : NSObject

@property (readonly, weak) id <SCYahooWeatherParserDelegate> delegate;
@property (readonly, copy) SCYahooWeatherInfoBlock block;

@property (readonly) NSInteger WOEID;
@property (readonly) SCWeatherUnit unit;

#pragma mark - Initialization
#pragma mark Initialize with Delegates
- (id)initWithWOEID:(NSInteger)WOEID weatherUnit:(SCWeatherUnit)unit delegate:(id <SCYahooWeatherParserDelegate>)delegate;
+ (id)weatherParserWithWOEID:(NSInteger)WOEID weatherUnit:(SCWeatherUnit)unit delegate:(id <SCYahooWeatherParserDelegate>)delegate;

#pragma mark Initialize with Blocks
- (id)initWithWOEID:(NSInteger)WOEID weatherUnit:(SCWeatherUnit)unit block:(SCYahooWeatherInfoBlock)block;
+ (id)weatherParserWithWOEID:(NSInteger)WOEID weatherUnit:(SCWeatherUnit)unit block:(SCYahooWeatherInfoBlock)block;

#pragma mark - Parsing
- (void)parse;

@end


