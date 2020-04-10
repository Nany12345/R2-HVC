function result_set = calculateResult(data_set, num_vec, seed, WVMethod)
% Calculate R2C newR2C & MonteCarlo
[data_size, dimension, data_set_size] = size(data_set);
%
result_set = zeros(1, data_size, data_set_size);
[W,N] = UniformVector(num_vec, dimension, seed, WVMethod{:});

%rng(seed);
%points = rand(num_vec,dimension);

for k = 1:data_set_size
    result_set(:, :, k) = result_single(data_set(:, :, k), num_vec , W);
end

    function result_one = result_single(data, num_vec, W)
        % Calculate single R2C newR2C result
        
        %dimension
        [Num,dim] = size(data);
        
        %Store results
        newR2C = zeros(1,Num);
        
        ref = 0;
        for i=1:Num
            data1 = data;
            s = data1(i,:);
            data1(i,:) = [];
            %R2 contribution by new method
            newR2C(1,i) = newR2ind(data1,W,s,ref);
        
        end
        result_one = newR2C;
    end

end
