import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool _fetchedValidData = true;
  dynamic _locationWeather;
  WeatherModel _weatherModel;

  @override
  void initState() {
    setState(() {
      _locationWeather = widget.locationWeather;

      if (widget.locationWeather == null) {
        _fetchedValidData = false;

        return;
      }

      _setWeatherModel();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      _locationWeather =
                          await _weatherModel.getLocationWeather();

                      setState(() => _setWeatherModel());
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      String city = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );

                      if (city != null) {
                        _locationWeather =
                            await _weatherModel.getCityWeather(city);

                        setState(() => _setWeatherModel());
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      _fetchedValidData
                          ? '${_weatherModel.temperature}°'
                          : '?°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      _fetchedValidData
                          ? _weatherModel.getWeatherIcon()
                          : 'Error',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  _fetchedValidData
                      ? '${_weatherModel.getMessage()} in ${_weatherModel.city}!'
                      : 'Failed to load.',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setWeatherModel() {
    _weatherModel = WeatherModel(
      city: _locationWeather['name'],
      condition: _locationWeather['weather'][0]['id'],
      temperature: _locationWeather['main']['temp'].round(),
    );
  }
}
