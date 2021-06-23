 A = xlsread('RootMeanSquare_3_Illum.xlsx')
 

Labels = {'Illum1', 'Illum2', 'Illum3'}; 
 bar(A,'grouped');
 
 set(gca, 'XTick', 1:3, 'XTickLabel', Labels);
 
 
 bar_legend =legend('Exp0','Exp1','Exp2','HDR'); 
 %set(gcf,'units','inch','position',[0,0,6,1]);
 %if(display_legend== 0)  %show legend or not
  %  set(bar_legend,'visible','off');
 %else
    
    %set legend font size
    set(bar_legend,'Location','NorthEast','color','none');
    set(bar_legend,'FontSize',6);
    
    set(bar_legend,'units','inches');
     lp=get(bar_legend,'outerposition');
     set(bar_legend,'outerposition',[2.45,2.3,0.5,0.5]);    
    
    
 %end
 
 %set(bar_legend,'Location',2)
 
 %{
 yticks = [get(gca,'ytick')]'; % There is a transpose operation here.
 percentsy = repmat('%', length(yticks),1);  %  makes a matrix equal to the size of the number of ticks
 yticklabel = [num2str(yticks) percentsy]; % concatenates the tick labels 
 %}
  %set(gca,'yticklabel',yticklabel, 'FontSize', 13, 'FontWeight','demi')% Sets tick labels back on the Axis
  set(gca,'FontSize', 10)% Sets tick labels back on the Axis
  %{
 
  plot(A, '-x', 'LineWidth', 2, 'MarkerSize',10)
yticks = (0:10)*10;
labels = cell(1, 10);
for k = 1:11
    labels{k} = [num2str(yticks(k)) ' %'];
end
axis([1,15, 0,80])
set(gca, 'YTickLabel', labels, 'XTick', [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], 'FontSize', 15, 'FontWeight','demi')
  %}
%PlotTitle='Aloe -Illum1';

ylabel('Root Mean Square Error')
%xlabel('Illumination Condition');
legend boxoff; 
%BarTitle='Aloe1-CostFilter';
title(BarTitle);
%FileName='BadPixelRate.png';
%FileName Created from automation_BadPixelRate.m


%change output size of figure
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 3 3]);


print(FileName,'-depsc2','-r300'); %save eps
print(FileName,'-dpng','-r300'); %save png
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 %{
 
 
 
 
 
 Labels = {'Illum1', 'Illum2', 'Illum3'};  % x axis
 bar(A,'grouped')
 set(gca, 'XTick', 1:3, 'XTickLabel', Labels);
 legend('Exp0','Exp1','Exp2','HDR')  %used to show legend
 %{
 yticks = [get(gca,'ytick')]'; % There is a transpose operation here.
 percentsy = repmat('%', length(yticks),1);  %  makes a matrix equal to the size of the number of ticks
 yticklabel = [num2str(yticks) percentsy]; % concatenates the tick labels 
 %}
  set(gca,'FontSize', 15, 'FontWeight','demi')% Sets tick labels back on the Axis
  set(bar_legend,'Location','NorthEast','color','none');
  %{
 
  plot(A, '-x', 'LineWidth', 2, 'MarkerSize',10)
yticks = (0:10)*10;
labels = cell(1, 10);
for k = 1:11
    labels{k} = [num2str(yticks(k)) ' %'];
end
axis([1,15, 0,80])
set(gca, 'YTickLabel', labels, 'XTick', [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], 'FontSize', 15, 'FontWeight','demi')
  %}
%PlotTitle='Aloe -Illum1';
ylabel('Root Mean Square Error')
xlabel('Illumination Condition');
legend boxoff; 
title(BarTitle);
%FileName='BadPixelRate.png';
%FileName Created from automation_BadPixelRate.m

print(FileName,'-depsc2','-r300'); %save eps
print(FileName,'-dpng','-r300'); %save png


%}