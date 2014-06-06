
#import <Foundation/Foundation.h>

typedef enum {
    SCWeatherUnitCelcius = 0, 
    SCWeatherUnitFahrenheit,
} SCWeatherUnit;

typedef enum {
    SCWeatherConditionTornado = 0,
    SCWeatherConditionTropicalStrom,
    SCWeatherConditionHurricane,
    SCWeatherConditionSevereThunderstroms,
    SCWeatherConditionThunderstorms,
    SCWeatherConditionMixedRaindAndSnow,
    SCWeatherConditionMixedRainAndSleet,
    SCWeatherConditionMixedSnowAndSleet,
    SCWeatherConditionFexxingDrizzle,
    SCWeatherConditionDrizzle,
    SCWeatherConditionFreezingRain,
    SCWeatherConditionShowers,
    SCWeatherConditionShowers2,
    SCWeatherConditionSnowFlurries,
    SCWeatherConditionLightSnowShowers,
    SCWeatherConditionBlowingSnow, 
    SCWeatherConditionSnow, 
    SCWeatherConditionHail,
    SCWeatherConditionSleet,
    SCWeatherConditionDust,
    SCWeatherConditionFoggy,
    SCWeatherConditionHaze,
    SCWeatherConditionSmoky,
    SCWeatherConditionBlustery,
    SCWeatherConditionWindy,
    SCWeatherConditionCold,
    SCWeatherConditionCloudy,
    SCWeatherConditionMostlyCloudyNight,
    SCWeatherConditionMostlyCloudyDay,
    SCWeatherConditionPartlyCloudyNight,
    SCWeatherConditionPartlyCloudyDay,
    SCWeatherConditionClearNight,
    SCWeatherConditionSunny,
    SCWeatherConditionFairNight,
    SCWeatherConditionFairDay,
    SCWeatherConditionMixedRainAndHail,
    SCWeatherConditionHot,
    SCWeatherConditionIsolatedThunderstorms,
    SCWeatherConditionScatteredThunderstorms,
    SCWeatherConditionScatteredThunderstorms2, 
    SCWeatherConditionScatteredShowers,
    SCWeatherConditionHeavySnow, 
    SCWeatherConditionScatteredSnowShowers,
    SCWeatherConditionHeavySnow2,
    SCWeatherConditionPartlyCloudy,
    SCWeatherConditionThundershowers,
    SCWeatherConditionSnowShowers,
    SCWeatherConditionIsolatedThundershowers,
    SCWeatherConditionNotAvailable,
} SCWeatherCondition;

@interface SCWeather : NSObject

@property SCWeatherCondition condition;
@property SCWeatherUnit unit;
@property NSInteger temperature;
@property (strong) NSString *weatherString;

@end
