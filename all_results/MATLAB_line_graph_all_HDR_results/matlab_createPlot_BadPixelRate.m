 A = xlsread('badPixelRate.xlsx')
  plot(A, '-x', 'LineWidth', 0.8, 'MarkerSize',5)
yticks = (0:10)*10;
labels = cell(1, 10);
for k = 1:11
    labels{k} = [num2str(yticks(k)) ' %'];
end
axis([1,15, 0,80])
%set(gca, 'YTickLabel', labels, 'XTick', [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], 'FontSize', 15, 'FontWeight','demi')
set(gca, 'YTickLabel', labels, 'XTick', [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], 'FontSize', 7)
xlabel('Bit-Rate')
ylabel('Bad Pixels / Image')

plot_legend=legend('CostFilter','SemiGlob','SSMP')

     %set legend font size
    set(plot_legend,'Location','NorthEast','color','none');
    set(plot_legend,'FontSize',6);
    
    set(plot_legend,'units','inches');
     lp=get(plot_legend,'outerposition');
     set(plot_legend,'outerposition',[2.30,2.0,0.5,0.5]);    
    legend boxoff; %turn off legend box



title(PlotTitle)

%change output size of figure
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 3 2.72]);


print(FileName,'-depsc2','-r300'); %save eps
print(FileName,'-dpng','-r300'); %save png