classdef fullyConnected
    %FULLYCONNECTED Encapsulates a layer of the network
    
    properties
        activation_fn
        X
        W
        b
        Z
        gamma
        beta
        elu_alpha = 1;
    end
    
    properties (SetAccess = private)
        n_in
        n_out
        m
        sigma
    end
    
    methods
        function obj = fullyConnected( X, W, b, gamma, beta, activation )
            
            [obj.m, obj.n_in] = size(X);
            obj.n_out = size(W, 2);
            
            sigm = sqrt(2 / (obj.n_in + obj.n_out));
            obj.sigma = sqrt(2) * sigm;  
            
            switch activation
                case 'relu'
                    obj.activation_fn = @(x) relu(x);
                case 'sigmoid'
                    obj.activation_fn = @(x) sigmoid(x);
                    obj.sigma = sigm ./ sqrt(2);
                case 'elu'
                    obj.activation_fn = @(x) elu(x, obj.alpha);
                case 'softmax'
                    obj.activation_fn = @(x) softmax(x);
                otherwise
                    obj.activation_fn = @(x) elu(x, alpha);
            end
            
           obj.X = X;
           obj.b = b;
           obj.W = obj.sigma .* randn(size(W));
           obj.gamma = gamma;
           obj.beta = beta;
           
        end
            
        function obj = feedforward(obj)
            obj.Z = batchNormalize(...
                obj.activation_fn(obj.X*obj.W + obj.b), obj.gamma, obj.beta);
        end
    end
end

