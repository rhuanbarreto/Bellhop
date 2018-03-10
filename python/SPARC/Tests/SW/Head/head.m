clear all, close all 

addpath /home/orodrig/FORdoc/at/Matlab/Misc/
addpath /home/orodrig/FORdoc/at/Matlab/Plot
addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Scooter

disp('SPARC:')
disp('Head-wave problem')

system('sparc.exe head');
fieldsco('head.grn')
plotmovie('head.shd.mat')

disp('done.')
