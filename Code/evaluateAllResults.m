function evaluateAllResults(dimension)
    if dimension == 3
        num_vector = 496;
    else
        num_vector = 495;
    end
    solution_number = 100;
    set_number = 100;
    max_vec = 1;
    for WVMethod = {'UNV','JAS','DAS','MSS-U','MSS-D'}
        seed_number = 30;
        if strcmp(WVMethod,'DAS') || strcmp(WVMethod,'MSS-D')
            seed_number = 1;
        end
        for problem_type = {'linear_triangular'}%,'concave_triangular','convex_triangular', ...
               % 'linear_invertedtriangular','concave_invertedtriangular','convex_invertedtriangular'}
           for reference_point = 0:1:4
                evaluate_result = zeros(max_vec, 2, seed_number);
                for seed = 1:seed_number
                    arr = evaluate(dimension, solution_number, ...
                        problem_type, set_number, num_vector, ...
                        seed, reference_point, WVMethod);
                    if arr == 0
                        continue;
                    end
                    evaluate_result(max_vec,:,seed) = arr;
                    dis_play = strcat(WVMethod,'_',problem_type,'_',num2str(reference_point),'_',num2str(seed));
                    disp(dis_play);
                end   
                file_name = strcat('./Result/evaluate_result_dim_',num2str(dimension), ...
                    '_numVec_',num2str(num_vector),'_probtype_',problem_type, ...
                    '_numSol_',num2str(solution_number), ...
                    '_',num2str(reference_point),'_',WVMethod,'.mat');
                file_name = file_name{:};
                save(file_name, "evaluate_result");
           end
        end
    end
end
