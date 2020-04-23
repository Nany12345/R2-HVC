%% plot the CIR versus ref_point
% solution_number = 100;
% set_number = 100;
% WVName = {'DAS','MSS-D','UNV','JAS','MSS-U'};
% for dimension = 3
%     if dimension == 3
%         num_vec = 91;
%     else
%         num_vec = 495;
%     end
%     for problem_type = {'linear_triangular','concave_triangular','convex_triangular', ...
%             'linear_invertedtriangular','concave_invertedtriangular','convex_invertedtriangular'}
%         CIR = ones(5,5);
%         WVInd = 1;
%         for WVMethod = WVName
%             for reference_point = 0:4
%                 file_name = strcat('./Result/evaluate_result_dim_',num2str(dimension), ...
%                     '_numVec_',num2str(num_vec),'_probtype_',problem_type, ...
%                     '_numSol_',num2str(solution_number), ...
%                     '_',num2str(reference_point),'_',WVMethod,'.mat');
%                 t = load(file_name{:});
%                 data = t.evaluate_result;
%                 if ~strcmp(WVMethod,'DAS') && ~strcmp(WVMethod,'MSS-D')
%                     data = mean(data,3);
%                 end
%                 CIR(WVInd,reference_point+1) = data(1,2);
%             end
%             WVInd = WVInd+1;
%         end
%         
%         file_name = strcat('./Figure/CIR/D',num2str(dimension),'_',problem_type, ...
%             '_',num2str(num_vec),'_Com');
%         file_name = file_name{:};
%         % 创建figure对象
%         Fig = figure(...
%             'Units',           'pixels',...
%             'Name',            file_name,...
%             'NumberTitle',     'off',...
%             'IntegerHandle',   'off', ...
%             'Position',       [100,100,1200,800]);
%         % 创建axes对象, 设定坐标轴属性
%         AxesH = axes(...
%             'Parent',          Fig,...
%             'Xlim',            [1 5],...
%             'Ylim',            [0.2 0.8],...
%             'XGrid',           'on',...
%             'YGrid',           'on',...
%             'Visible',         'on',...
%             'FontSize',        50,...
%             'XTick',           [1,2,3,4,5],...
%             'YTick',           0.2:0.2:0.8,...
%             'XTickLabel',      {'0','-0.1','-0.2','-0.3','-0.4'});
%         AxesH.XLabel.String = 'Reference point';
%         AxesH.YLabel.String = 'CIR';
% 
%         hold on;
%         x = 1:5;
%         lw = 6; ms = 25;
% 
%         hold on;
%         p1 = plot(x,CIR(1,:), '-d','LineWidth',lw,'markersize',ms);
%         p2 = plot(x,CIR(2,:), '-s','LineWidth',lw,'markersize',ms);
%         p3 = plot(x,CIR(3,:), '-o','LineWidth',lw,'markersize',ms);
%         p4 = plot(x,CIR(4,:), '-*','LineWidth',lw,'markersize',ms);
%         p5 = plot(x,CIR(5,:), '->','LineWidth',lw,'markersize',ms);
% 
%         legend(AxesH,[p1,p2,p3,p4,p5], WVName,...
%             'Box',                     'off',...
%             'NumColumns',               2);
% 
%         % 指定保存路径和格式
%         saveas(Fig,['./' Fig.Name],'emf');
%         close all;
%     end
% end

%% plot the CIR versus ref_point for M=3 num_vec=91 versus num_vec=496
% solution_number = 100;
% set_number = 100;
% WVName = {'DAS','MSS-D','UNV','JAS','MSS-U'};
% for dimension = 3
%     if dimension == 3
%         num_vec = 496;
%     else
%         num_vec = 495;
%     end
%     for problem_type = {'linear_triangular'}
%         CIR = ones(5,5);
%         WVInd = 1;
%         for WVMethod = WVName
%             for reference_point = 0:4
%                 file_name = strcat('./Result/evaluate_result_dim_',num2str(dimension), ...
%                     '_numVec_',num2str(num_vec),'_probtype_',problem_type, ...
%                     '_numSol_',num2str(solution_number), ...
%                     '_',num2str(reference_point),'_',WVMethod,'.mat');
%                 t = load(file_name{:});
%                 data = t.evaluate_result;
%                 if ~strcmp(WVMethod,'DAS') && ~strcmp(WVMethod,'MSS-D')
%                     data = mean(data,3);
%                 end
%                 CIR(WVInd,reference_point+1) = data(1,2);
%             end
%             WVInd = WVInd+1;
%         end
%         
%         file_name = strcat('./Figure/CIR/D',num2str(dimension),'_',problem_type, ...
%             '_',num2str(num_vec));
%         file_name = file_name{:};
%         % 创建figure对象
%         Fig = figure(...
%             'Units',           'pixels',...
%             'Name',            file_name,...
%             'NumberTitle',     'off',...
%             'IntegerHandle',   'off', ...
%             'Position',       [100,100,1200,800]);
%         % 创建axes对象, 设定坐标轴属性
%         AxesH = axes(...
%             'Parent',          Fig,...
%             'Xlim',            [1 5],...
%             'Ylim',            [0.4 1],...
%             'XGrid',           'on',...
%             'YGrid',           'on',...
%             'Visible',         'on',...
%             'FontSize',        50,...
%             'XTick',           [1,2,3,4,5],...
%             'YTick',           0.4:0.2:1,...
%             'XTickLabel',      {'0','-0.1','-0.2','-0.3','-0.4'});
%         AxesH.XLabel.String = 'Reference point';
%         AxesH.YLabel.String = 'CIR';
% 
%         hold on;
%         x = 1:5;
%         lw = 6; ms = 25;
% 
%         hold on;
%         p1 = plot(x,CIR(1,:), '-d','LineWidth',lw,'markersize',ms);
%         p2 = plot(x,CIR(2,:), '-s','LineWidth',lw,'markersize',ms);
%         p3 = plot(x,CIR(3,:), '-o','LineWidth',lw,'markersize',ms);
%         p4 = plot(x,CIR(4,:), '-*','LineWidth',lw,'markersize',ms);
%         p5 = plot(x,CIR(5,:), '->','LineWidth',lw,'markersize',ms);
% 
%         legend(AxesH,[p1,p2,p3,p4,p5], WVName,...
%             'Box',                     'off',...
%             'NumColumns',               2);
% 
%         % 指定保存路径和格式
%         saveas(Fig,['./' Fig.Name],'emf');
%         close all;
%     end
% end

%% save WV to WV_Data.mat
% Data = cell(1,2);
% wv_method = {'DAS','MSS-D','UNV','JAS','MSS-U','Proposed'};
% %Data{1,objInd} = zeros(N,objVal(3,5),30(independent runs),5('DAS','MSS-D','UNV','JAS','MSS-U'));
% obj = [3,5];
% for objInd = 1:2
%     objVal = obj(objInd);
%     if objVal == 3
%         N = 91;
%     elseif objVal == 5
%         N = 495;
%     end
%     TD = zeros(N,obj(objInd),30,size(wv_method,2));
%     for wvInd = 1:6
%         newData = zeros(N,objVal,30);
%         parfor seed_num = 1:30
%             newData(:,:,seed_num) = UniformVector(N,objVal,seed_num,wv_method{1,wvInd});
%             disp([num2str(obj(objInd)),' ',num2str(wvInd),' ',num2str(seed_num)]);
%         end
%         TD(:,:,:,wvInd) = newData;
%     end
%     Data{1,objInd} = TD;
% end
% save('WV_Data.mat','Data');

%% plot the distribution of Data
% clear;
% Data = load('WV_Data.mat','Data');
% Data = Data.Data;
% obj = [3,5];
% wv_method = {'DAS','MSS-D','UNV','JAS','MSS-U'};
% for objInd = 1:2   
%     if objInd == 1
%         num_vec = 91;
%     else
%         num_vec = 495;
%     end
%     for wv_ind = 1:5
%         Data_Obj = Data{1,objInd};
%         % 统计点分布数据
%         num_interval = 100;
%         num_dist = zeros(1,num_interval);
%         file_name = strcat('./Result/evaluate_result_dim_',num2str(obj(objInd)), ...
%             '_numVec_',num2str(num_vec),'_probtype_linear_triangular', ...
%             '_numSol_100', ...
%             '_0_',wv_method{wv_ind},'.mat');
%         t = load(file_name);
%         data = t.evaluate_result;
%         CIR = zeros(1,30);
%         if ~strcmp(wv_method{wv_ind},'DAS') && ~strcmp(wv_method{wv_ind},'MSS-D')
%             for i = 1:30
%                 CIR(1,i) = data(1,2,i);
%             end
%             mid_index = find(CIR==median(CIR));
%             seed_num = mid_index(1);
%         else
%             seed_num = 1;
%         end
%         Data_seed = Data_Obj(:,:,seed_num,wv_ind);
%         [N,M] = size(Data_seed);
%         % 计算曲面距离
%         Dist = zeros(N,M);
%         for i = 1:M
%             S_P = Data_seed;
%             S_P(:,i) = 0;
%             S_P = S_P./sqrt(sum(S_P.^2,2));
%             Dist(:,i) = sqrt(sum((Data_seed-S_P).^2,2));
%             Dist(:,i) = 2*asin(Dist(:,i)/2);
%         end
%         Dist = min(Dist,[],2);
%         % 制作刻度尺
%         Interval = linspace(0,1,num_interval+1);
%         Max_Dist = 1/M;
%         for i = 2:M
%             Max_Dist = Max_Dist+(1/sqrt(M-1)-1/sqrt(M))^2;
%         end
%         Max_Dist = 2*asin(sqrt(Max_Dist)/2);
%         Interval = Interval*Max_Dist;
%         % 统计点落在不同位置的数量
%         for i = 1:num_interval
%             for j = 1:N
%                 if j == N
%                     if Dist(j) >= Interval(i) && Dist(j) <= Interval(i+1)
%                         num_dist(1,i) = num_dist(1,i)+1;
%                     end
%                 else
%                     if Dist(j) >= Interval(i) && Dist(j) < Interval(i+1)
%                         num_dist(1,i) = num_dist(1,i)+1;
%                     end
%                 end
%             end
%         end
%         % 画图
%         file_name = ['./Figure/modified-distance/M',num2str(M),'_', ...
%             wv_method{wv_ind}];
%         % 创建figure对象
%         Fig = figure(...
%             'Units',           'pixels',...
%             'Name',            file_name,...
%             'NumberTitle',     'off',...
%             'IntegerHandle',   'off', ...
%             'Position',       [100,100,600,500]);
%         % 创建axes对象, 设定坐标轴属性
%         AxesH = axes(...
%             'Parent',          Fig,...
%             'Xlim',            [0.005,1.005],...
%             'Ylim',            [0 inf],...
%             'XGrid',           'on',...
%             'YGrid',           'on',...
%             'Visible',         'on',...
%             'FontSize',        30,...
%             'XTick',           0:0.2:1);
%         AxesH.XLabel.String = 'Distance to Boundary';
%         AxesH.YLabel.String = 'Number';
% 
%         hold on;
%         x = 0.01:0.01:1;
%         lw = 6; ms = 25;
% 
%         hold on;
%         bar(x,num_dist);
% 
%         % 指定保存路径和格式
%         saveas(Fig,['./' Fig.Name],'emf');
%         close all;
%     end
% end

%% plot 3-objective DVs distribution
Data = cell(1,2);
wv_method = {'DAS','MSS-D','UNV','JAS','MSS-U'};
%Data{1,objInd} = zeros(N,objVal(3,5),30(independent runs),5('DAS','MSS-D','UNV','JAS','MSS-U'));
data = load('WV_Data.mat');
data = data.Data;
data = data{1,1};
for wv_ind = 1:5
    data_wv = data(:,:,1,wv_ind);
    f = figure;
    scatter3(data_wv(:,1),data_wv(:,2),data_wv(:,3),50,'b','fill');
    ax = gca;
    ax.FontSize = 30;
    view(135,45);
    saveas(f,['./Figure/DV/',wv_method{wv_ind},'.emf']);
    close all;
end
    