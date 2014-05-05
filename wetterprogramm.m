clear all

urlwrite('http://api.met.no/weatherapi/locationforecast/1.8/?lat=53.143889;lon=8.213889', 'weather.xml');

xml = xmlread ('weather.xml');

daten = parse_xml(xml);