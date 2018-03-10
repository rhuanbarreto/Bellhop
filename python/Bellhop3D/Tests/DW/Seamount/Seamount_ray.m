clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Seamount profile:') 
disp('Ray trace run')
disp('Cartesian beams')

system('bellhop3d.exe Seamount_ray');

plotray3d('Seamount_ray.ray')

disp('done.')
