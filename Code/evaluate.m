function avg_arr = evaluate(dimension, solution_number, problem_type, set_number, num_vector, seed, reference_point, WVMethod)
    % Load result
    result_set_file_name = strcat('./Raw_Result/result_set_',num2str(dimension), ...
         '_',problem_type,'_numVec_',num2str(num_vector), ...
         '_seed_',num2str(seed),'_numSol_',num2str(solution_number), ...
         '_',num2str(reference_point),'_',WVMethod,'.mat');
    
    result_set_file_name = result_set_file_name{:};
    
    result_set = load(result_set_file_name);
    result_set = result_set.x;
    % Initialize
    total_consis_newR2C_1 = 0;
    total_correct_newR2C_1 = 0;
    
    % Evaluate
    for i = 1:set_number
        % Slice
        HVC = result_set(1, :, i);
        newR2C = result_set(2, :, i);
        % Calculate consistency
        r2 = consistency(HVC,newR2C,1);
        total_consis_newR2C_1 = total_consis_newR2C_1 + r2;
        
        % Calculate worst point
        r2 = isWorstSame(HVC, newR2C, 1);
        total_correct_newR2C_1 = total_correct_newR2C_1 + r2;
    end
    avg_consis_newR2C_1 = total_consis_newR2C_1/set_number;
    avg_correct_newR2C_1 = total_correct_newR2C_1/set_number;
    avg_arr = [avg_consis_newR2C_1, avg_correct_newR2C_1];
end