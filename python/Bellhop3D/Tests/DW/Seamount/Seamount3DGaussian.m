clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Seamount2D:') 
disp('Ray trace run')
disp('Geometric gaussian beams')

system('bellhop3d.exe Seamount3DGaussian');

plotray3d('Seamount3DGaussian.ray')

disp('done.')
