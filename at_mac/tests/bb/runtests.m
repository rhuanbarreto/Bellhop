% Munk profile test cases
% mbp
global units
units = 'km';

kraken(  'MunkK' )
scooter( 'MunkS' )

if ( exist( 'MunkK.shd', 'file' ) )
    figure
    plotshd( 'MunkK.shd', 100 )
    %caxisrev( [ 50 100 ] )
end

if ( exist( 'MunkS.shd.mat', 'file' ) )
    figure
    plotshd( 'MunkS.shd.mat', 100 )
    %caxisrev( [ 50 100 ] )
end


