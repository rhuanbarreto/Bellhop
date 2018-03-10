clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Munk SSP:') 
disp('Ray trace run') 
disp('Geometric hat beams in Cartesian coordinates')

system('bellhop3d.exe munk3d_ray');

plotray3d('munk3d_ray.ray')

disp('done.')
