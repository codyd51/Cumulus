
#import "SCWeather.h"

@implementation SCWeather

- (NSString *)description
{
    if (!self.weatherString) return [super description];
    return self.weatherString;
}
@end
