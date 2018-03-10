clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - TWedge profile:') 
disp('Ray trace run')
disp('Cartesian beams')

system('bellhop3d.exe wedge3d_ray');

plotray3d('wedge3d_ray.ray')

disp('done.')
