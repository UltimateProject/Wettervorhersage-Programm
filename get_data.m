function [ daten ] = get_data(Koordinaten)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

urlwrite(Koordinaten,'weather.xml');

xml = xmlread('weather.xml');

daten=parse_xml(xml);

end

