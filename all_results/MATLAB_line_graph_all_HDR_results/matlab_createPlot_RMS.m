 A = xlsread('RootMeanSquare.xlsx')
  plot(A, '-x', 'LineWidth', 0.8, 'MarkerSize',5)

set(gca,'XTick', [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], 'FontSize', 7 , 'XLim', [1,15])
xlabel('Bit-Rate')
ylabel('Root Mean Squared Error')


plot_legend=legend('CostFilter','SemiGlob','SSMP')

     %set legend font size
    set(plot_legend,'Location','NorthEast','color','none');
    set(plot_legend,'FontSize',6);
    
    set(plot_legend,'units','inches');
     lp=get(plot_legend,'outerposition');
     set(plot_legend,'outerposition',[2.30,2.0,0.5,0.5]);    
    legend boxoff; %turn off legend box

title(PlotTitle);


%change output size of figure
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 3 2.72]);

print(FileName,'-depsc2','-r300'); %save eps
print(FileName,'-dpng','-r300'); %save png