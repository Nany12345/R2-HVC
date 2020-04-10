function [V,N] = UniformVector(N,M,seed,WVMethod)
    switch WVMethod
        case 'UNV'
            mu = zeros(1,M);
            sigma = eye(M,M);
            rng(seed);
            R = mvnrnd(mu,sigma,N);
            V = abs(R./repmat(sqrt(sum(R.^2,2)),1,M));
        case 'DAS'
            H1 = 1;
            while nchoosek(H1+M,M-1) <= N
                H1 = H1 + 1;
            end
            V = nchoosek(1:H1+M-1,M-1) - repmat(0:M-2,nchoosek(H1+M-1,M-1),1) - 1;
            V = ([V,zeros(size(V,1),1)+H1]-[zeros(size(V,1),1),V])/H1;
            V = max(V,1e-6);
            V = V./repmat(sqrt(sum(V.^2,2)),1,M);
            N = size(V,1);
        case 'JAS'
            V = zeros(N,M);
            rng(seed);
            V(:,1) = rand(N,1);
            V(:,1) = 1-(V(:,1).^(1/(M-1)));
            for obj = 2:M-1
                V(:,obj) = (1-sum(V(:,1:obj-1),2)).*(1-rand(N,1).^(1/(M-obj)));
            end
            V(:,M) = 1-sum(V,2);
            V = V./sqrt(sum(V.^2,2));
        case 'MSS-U'
            mu = zeros(1,M);
            sigma = eye(M,M);
            rng(seed);
            if M==3
                R = mvnrnd(mu,sigma,49770);
            elseif M==5
                R = mvnrnd(mu,sigma,46376); 
            end
            S = abs(R./sqrt(sum(R.^2,2)));
            V = zeros(N,M);
            V(1:M,:) = eye(M,M);
            for i = M+1:N
               distance = dist(V(1:i-1,:),S');
               distance = min(distance);
               [~,maxInd] = max(distance);
               V(i,:) = S(maxInd,:);
               S(maxInd,:) = [];
            end
        case 'MSS-D'
            H1 = 1;
            ZN = 0;
            if M==3
                ZN = 49770;
            elseif M==5
                ZN = 46376; 
            end
            while nchoosek(H1+M,M-1) <= ZN
                H1 = H1 + 1;
            end
            V = nchoosek(1:H1+M-1,M-1) - repmat(0:M-2,nchoosek(H1+M-1,M-1),1) - 1;
            V = ([V,zeros(size(V,1),1)+H1]-[zeros(size(V,1),1),V])/H1;
            if H1 < M
                H2 = 0;
                while nchoosek(H1+M-1,M-1)+nchoosek(H2+M,M-1) <= N
                    H2 = H2 + 1;
                end
                if H2 > 0
                    W2 = nchoosek(1:H2+M-1,M-1) - repmat(0:M-2,nchoosek(H2+M-1,M-1),1) - 1;
                    W2 = ([W2,zeros(size(W2,1),1)+H2]-[zeros(size(W2,1),1),W2])/H2;
                    V  = [V;W2/2+1/(2*M)];
                end
            end
            V = max(V,1e-6);
            S = V./sqrt(sum(V.^2,2));
            V = zeros(N,M);
            V(1:M,:) = eye(M,M);
            for i = M+1:N
               distance = dist(V(1:i-1,:),S');
               distance = min(distance);
               [~,maxInd] = max(distance);
               V(i,:) = S(maxInd,:);
               S(maxInd,:) = [];
            end
        case 'Proposed'
            mu = zeros(1,M);
            sigma = eye(M,M);
            rng(seed);
            Num_WV = 49770; 
            if M==5
                Num_WV = 46379; 
            end
            R = mvnrnd(mu,sigma,Num_WV);
            S = abs(R./sqrt(sum(R.^2,2)));
            Dist = zeros(Num_WV,M);
            for i = 1:M
                S_P = S;
                S_P(:,i) = 0;
                S_P = S_P./sqrt(sum(S_P.^2,2));
                Dist(:,i) = sqrt(sum((S-S_P).^2,2));
                Dist(:,i) = 2*asin(Dist(:,i)/2);
            end
            Dist = min(Dist,[],2);
            Interval = linspace(0,1,N+1);
            Max_Dist = 1/M;
            for i = 2:M
                Max_Dist = Max_Dist+(1/sqrt(M-1)-1/sqrt(M))^2;
            end
            Max_Dist = sqrt(Max_Dist);
            WV_Dist = cell(1,N);
            Interval = Interval*Max_Dist;
            for i = 1:N
                WV_Dist{1,i} = [];
                for j = 1:Num_WV
                    if j == Num_WV
                        if Dist(j) >= Interval(i) && Dist(j) <= Interval(i+1)
                            WV_Dist{1,i} = [WV_Dist{1,i};S(j,:)];
                        end
                    else
                        if Dist(j) >= Interval(i) && Dist(j) < Interval(i+1)
                            WV_Dist{1,i} = [WV_Dist{1,i};S(j,:)];
                        end
                    end
                end
            end
            Sel_Count = 1;
            V = [];
            Archive = [];
            for i = 1:N
                if isempty(WV_Dist{1,i}) && i ~= N
                    Sel_Count = Sel_Count+1;
                else
                    if size(WV_Dist{1,i},1) < Sel_Count
                        V = [V;WV_Dist{1,i}];
                        if i == N
                            list = randperm(size(Archive,1));
                            V = [V;Archive(list(1:Sel_Count-size(WV_Dist{1,i},1)),:)];
                        end
                        Sel_Count = 1+Sel_Count-size(WV_Dist{1,i},1);
                    else
                        list = randperm(size(WV_Dist{1,i},1));
                        V = [V;WV_Dist{1,i}(list(1:Sel_Count),:)];
                        Archive = [Archive;WV_Dist{1,i}(list(Sel_Count:length(list)),:)];
                        Sel_Count = 1;
                    end
                end
            end
    end
end