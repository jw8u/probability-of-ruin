alg1 = function(u){
  p = 1 - (1+0.1)^-1
  z = rep(NA,1000)
  k = rgeom(1000,p)
  for (i in 1:1000){
    if (k[i] >=1){
      v = runif(k[i])
      x = ifelse(v >= 0.5, (2*(1-v))^-1, 2*v)
      z[i] = ifelse(sum(x)>u, 1, 0)
    }
    else{
      z[i] = 0
    }
  }
  return(c(mean(z),1.96*sd(z)/sqrt(1000)))
}

alg2 = function(u){
  p = 1 - (1+0.1)^-1
  z = rep(NA,1000)
  k = rgeom(1000,p)
  for (i in 1:1000){
    if (k[i]-1 >=1){
      v = runif(k[i]-1)
      x = ifelse(v >= 0.5, (2*(1-v))^-1, 2*v)
      y = u - sum(x)
      z[i] = B0_hat(y)
    }
    else{
      z[i] = B0_hat(u)
    }
  }
  return(c(mean(z),1.96*sd(z)/sqrt(1000)))
}

alg3 = function(u){
  p = 1 - (1+0.1)^-1
  z = rep(NA,1000)
  k = rgeom(1000,p)
  for (i in 1:1000){
    if (k[i] >=2){
      v = runif(k[i])
      x = ifelse(v >= 0.5, (2*(1-v))^-1, 2*v)
      x = sort(x)[-length(x)]
      y = u - sum(x)
      m = max(x)
      z[i] = B0_hat(max(y,m))/B0_hat(m)
    }
    else{
      z[i] = B0_hat(u)/B0_hat(0)
    }
  }
  return(c(mean(z),1.96*sd(z)/sqrt(1000)))
}



B0_hat = function(y){
  if (y >=1){
    z = (2*y)^-1
  } else if (1 > y & y>=0){
    z = 1 - 0.5*y
  } else{
    z = 1
  }
  return(z)
}




set.seed(1)
alg1(10)
alg1(50)
alg1(100)
alg1(500)
alg1(1000)

