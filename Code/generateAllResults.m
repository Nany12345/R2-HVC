function generateAllResults(dimension,WVMethod)
    set_number = 100;
    solution_number = 100;
    for problem_type = {'linear_triangular','concave_triangular','convex_triangular', ...
            'linear_invertedtriangular','concave_invertedtriangular','convex_invertedtriangular'}
%     for problem_type = {'linear_triangular'}
        for reference_point = 0:4
            disp(strcat('D',num2str(dimension),'_',WVMethod,'_',problem_type, ...
                '_ref=',num2str(reference_point)));
            % File name data_set_d_solutionNumber_problemType_setNum_numVector
            data_set_file_name = ['./Data/data_set_',num2str(dimension),'_', ...
                num2str(solution_number),'_',problem_type,'_', ...
                num2str(set_number),'_',num2str(reference_point),'.mat'];
            data_set_file_name = [data_set_file_name{:}];
            data_set = load(data_set_file_name, 'data_set');
            data_set = data_set.data_set;
            HVC_file_name = ['./Result/HVC_',num2str(dimension),'_', ...
                num2str(solution_number),'_',problem_type,'_', ...
                num2str(set_number),'_',num2str(reference_point),'.mat'];
            HVC_file_name = [HVC_file_name{:}];
            if exist(HVC_file_name, 'file') == 2
                HVC = load(HVC_file_name);
                HVC = HVC.HVC;
            end
            if dimension == 3
                num_vector = 91;
            else
                num_vector = 495;
            end
            seed_number = 30;
            if strcmp(WVMethod,'DAS') || strcmp(WVMethod,'MSS-D')
                seed_number = 1;
            end
            parfor seed = 1:seed_number
                 % File name result_set_d_solutionNumber_problemType_setNum_numVector
                 result_set_file_name = ['./Raw_Result/result_set_',num2str(dimension), ...
                     '_',problem_type,'_numVec_',num2str(num_vector), ...
                     '_seed_',num2str(seed),'_numSol_',num2str(solution_number), ...
                     '_',num2str(reference_point),'_',WVMethod,'.mat'];
                 result_set_file_name = [result_set_file_name{:}];
                 if exist(result_set_file_name, 'file') ~= 2
                    result_set = calculateResult(data_set, num_vector, seed, WVMethod);
                    result_set = [HVC; result_set];
                    parsave(result_set_file_name, result_set);
                 end   
            end
        end
    end
end
