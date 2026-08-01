-----------------------------------
-- func: senseweather
-- desc: give odds of weather for the day
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i',
}

local function GetWeatherName(weather)
    local weatherName = ""
    if weather == xi.weather.NONE then
        weatherName = "none"
    elseif weather == xi.weather.SUNSHINE then
        weatherName = "sunny"
    elseif weather == xi.weather.CLOUDS then
        weatherName = "cloudy"
    elseif weather == xi.weather.FOG then
        weatherName = "foggy"
    elseif weather == xi.weather.HOT_SPELL then
        weatherName = "hot"
    elseif weather == xi.weather.HEAT_WAVE then
        weatherName = "very hot"
    elseif weather == xi.weather.RAIN then
        weatherName = "rainy"
    elseif weather == xi.weather.SQUALL then
        weatherName = "squally"
    elseif weather == xi.weather.DUST_STORM then
        weatherName = "dusty"
    elseif weather == xi.weather.SAND_STORM then
        weatherName = "sandy"
    elseif weather == xi.weather.WIND then
        weatherName = "windy"
    elseif weather == xi.weather.GALES then
        weatherName = "galy"
    elseif weather == xi.weather.SNOW then
        weatherName = "snowy"
    elseif weather == xi.weather.BLIZZARDS then
        weatherName = "blizzardy"
    elseif weather == xi.weather.THUNDER then
        weatherName = "thundery"
    elseif weather == xi.weather.THUNDERSTORMS then
        weatherName = "very thundery"
    elseif weather == xi.weather.AURORAS then
        weatherName = "aurory"
    elseif weather == xi.weather.STELLAR_GLARE then
        weatherName = "glary"
    elseif weather == xi.weather.GLOOM then
        weatherName = "gloomy"
    elseif weather == xi.weather.DARKNESS then
        weatherName = "dark"
    end

    return weatherName
end

commandObj.onTrigger = function(player, weatherType)
    
    if weatherType == nil then
        local weather = SenseWeather(player)

        local text = string.format('Today will be %s', GetWeatherName(weather.normal))

        if weather.common ~= weather.normal then
            text = text .. string.format(', probably %s', GetWeatherName(weather.common))
        end

        if weather.rare ~= weather.common and weather.rare ~= weather.normal then
            text = text .. string.format(', maybe %s', GetWeatherName(weather.rare))
        end

        text = text .. string.format('. Weather is about to change in %d', weather.change)

        player:PrintToPlayer(text)
    else
        local weather = SenseFutureWeather(player, weatherType)

        local text = "";
        if weatherType < xi.weather.SUNSHINE or weatherType > xi.weather.DARKNESS then
            text = 'Invalid weather'
        elseif weather.common > 2800 and weather.normal > 2800 and weather.rare > 2800 then
            text = string.format('No %s in the next 30 days', GetWeatherName(weatherType))
        else
            text = string.format('Its going to be %s in ', GetWeatherName(weatherType))

            if weather.normal <= weather.common and weather.normal <= weather.rare then
                text = text .. string.format('%d days', weather.normal)
            elseif weather.common < weather.normal and weather.common <= weather.rare then
                text = text .. string.format('%d days (probably)', weather.common)
            else
                text = text .. string.format('%d days (maybe)', weather.rare)
            end
        end

        player:PrintToPlayer(text)
    end
end

return commandObj