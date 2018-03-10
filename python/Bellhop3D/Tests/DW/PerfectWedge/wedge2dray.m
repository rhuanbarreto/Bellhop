clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Perfect wedge:') 
disp('Ray trace run')
disp('Geometric hat beams in ray-centered coordinates')

system('bellhop3d.exe wedge2dray');

plotray3d('wedge2dray.ray')

disp('done.')
