function [fitresult, gof] = ODpoly(Sequence, AmountSKE)
%CREATEFIT(SEQUENCE,AMOUNTSKE)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : Sequence
%      Y Output: AmountSKE
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 17-Jan-2017 18:49:13


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( Sequence, AmountSKE );

% Set up fittype and options.
ft = fittype( 'poly1' );
opts = fitoptions( ft );
opts.Lower = [-Inf -Inf];
opts.Upper = [Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% % Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'AmountSKE vs. Sequence', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 'Sequence' );
% ylabel( 'AmountSKE' );
% grid on


