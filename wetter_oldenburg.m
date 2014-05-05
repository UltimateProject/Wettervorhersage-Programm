function [] = wetter_oldenburg()
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

clear all
clc

daten = get_data();
ordner_temperatur = get_temp(daten);
ordner_windrichtung = get_windDirection(daten);
ordner_windgeschw = get_windSpeed(daten);
ordner_bewoelkung = get_cloudiness(daten);


end

