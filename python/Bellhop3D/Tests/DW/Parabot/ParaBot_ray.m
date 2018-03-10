clear all, close all

addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite
addpath /home/orodrig/FORdoc/at/Matlab/Plot

disp('Bellhop3D - Parabolic bottom profile:') 
disp('Ray trace run')
disp('Cartesian beams')

system('cp ParaBot.ati ParaBot_ray.ati');
system('cp ParaBot.bty ParaBot_ray.bty');
system('bellhop3d.exe ParaBot_ray');
system('rm ParaBot_ray.ati');
system('rm ParaBot_ray.bty');

plotray3d('ParaBot_ray.ray')

disp('done.')
