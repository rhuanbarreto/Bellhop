clear all, close all 

addpath /home/orodrig/FORdoc/at/Matlab/Misc
addpath /home/orodrig/FORdoc/at/Matlab/Plot
addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Scooter

disp('SPARC: Munk profile')

system('sparc.exe munk');
fieldsco('munk.grn');
plotmovie('munk.shd.mat');

disp('done.')
