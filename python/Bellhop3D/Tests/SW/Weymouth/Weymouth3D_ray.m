clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Weymouth (3D run):') 
disp('Ray trace run')
disp('Geometric hat beams in Cartesian coordinates')

system('cp Weymouth.bty Weymouth3D_ray.bty');
system('bellhop3d.exe Weymouth3D_ray');
system('rm Weymouth3D_ray.bty');

plotray3d('Weymouth3D_ray.ray')

disp('done.')
