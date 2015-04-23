function y_hat=predict(x_new,model,options={})

  # linear models implemented: 
  # - normal equation
  # - normal equation, multiple output
  # - ridge regression
  # - least angle regression
  # - least angle regression - lasso modification
  # - least angle regression - FS0 modification
  # - principal components regression
  # - partial least squares
  # - reduced rank regression, multiple output
  # - smooth reduced rank regression, multiple output
  # - hybrid shrinkage, multiple output
  
  # evaluate arguments in options
  for i=2:2:numel(options) 
    eval(strcat(options{(i-1)}, '=[', num2str(options{i}),'];'))
  end
  
  [m n]=size(x_new);
  
  if isfield(model,'mu')
    x_new=normalize(x_new,model.mu,model.sd);
  end
  
  switch model.type
    case 'normal'
      y_hat=[ones(m,1) x_new]*model.beta;
    case 'normal.multi'
      y_hat=[ones(m,1) x_new]*model.beta;
    case 'ridge'
      y_hat=[ones(m,1) x_new]*model.beta;
    case 'lar'
      y_hat=[ones(m,1) x_new]*model.beta;
    case 'lar-lasso'
      y_hat=[ones(m,1) x_new]*model.beta;
    case 'pcr'
      y_hat=[ones(m,1) x_new]*model.beta;
    case 'pls'
      y_hat=[ones(m,1) x_new]*model.beta;
    case 'reduced rank'
      y_hat=[ones(m,1) x_new]*model.beta;
    case 'curds-whey'
      y_hat=[ones(m,1) x_new]*model.beta;
    case 'hybrid'
      y_hat=[ones(m,1) x_new]*model.beta;
  endswitch
  
end