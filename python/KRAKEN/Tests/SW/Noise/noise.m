clear all, close all 

disp('Noise comparison from the modal and spectral integral formulas...')

addpath /home/orodrig/FORdoc/at/Matlab/Kraken 
addpath /home/orodrig/FORdoc/at/Matlab/Misc
addpath /home/orodrig/FORdoc/at/Matlab/Noise
addpath /home/orodrig/FORdoc/at/Matlab/ReadWrite

Rmax_km = linspace( 1, 100, 50 );   % max range of integration of noise sources

sd = 1.25;  % depth of noise sources
rd = 0:1:100;

SL       = 168.0;   % source level in dB
rho_ship = 3;       % ships per square degree

% following assumes a degree at the equator ...
km_per_degree = 107;   % (is this number right?)
rho_SL = 10^( SL / 10 ) * rho_ship / ( km_per_degree * 1000.0 )^2;  % q2 or source level per m^2
rho_SL_dB = 10 * log10( rho_SL );

rho_SL_dB = 54;   % monopole strength from Kewley for 800 Hz and 40 knots

Component = 'P';

disp('Calling KRAKEN...') 
system('kraken.exe pekeris');

disp('Calling SCOOTER...') 
system('scooter.exe pekeris');
system('scooter.exe halfspace');

NL = modal_noise_full( 'pekeris.mod', rho_SL_dB, sd, rd, Rmax_km, Component );

figure
imagesc( Rmax_km, rd, NL )
colorbar
caxis( [ 60 80 ] )
xlabel( 'Range (km)' )
ylabel( 'Depth (m)' )
title( 'KRAKEN' )

% Modal noise vs. depth using full matrix
% we just take the value from the matrix NL for the largest range

figure
plot( rd, NL( :, end ) )
xlabel( 'Receiver depth (m)' )
ylabel( 'NL (dB)' )
axis( [ 0 100 60 80 ] )
title( 'KRAKEN' )

% Modal noise vs. depth using diagonal terms only

NL = modal_noise_diag( 'pekeris.mod', rho_SL_dB, sd, rd, Rmax_km, Component );
hold on
plot( rd, NL( :, end ), 'g' )

% Spectral noise vs. depth
% Note that SCOOTER has to be run with stabilizing attenuation disabled
% ( TopOpt( 6 : 6 ) = '0' )

NL = spectral_noise( 'pekeris.grn', rho_SL_dB, sd, rd );
hold on
plot( rd, NL, 'r' )

legend( 'NM Full', 'NM Diag', 'Spectral' )

%%

% tests for halfspace
% If the source is put at lambda/4 then
% the far field should have a level 13.2 dB higher than rho_SL_dB

NL = spectral_noise( 'halfspace.grn', rho_SL_dB, sd, rd );

figure
plot( rd, NL )
xlabel( 'Receiver depth (m)' )
ylabel( 'NL (dB)' )
title( 'Halfspace, spectral formula' )

disp('done.')
