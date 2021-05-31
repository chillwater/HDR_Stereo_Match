function [ nameFolds ] = ListSubfolders( pathFolder)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    d = dir(pathFolder);
    isub = [d(:).isdir]; %# returns logical vector
    nameFolds = {d(isub).name}';
    nameFolds(ismember(nameFolds,{'.','..'})) = [];


end

