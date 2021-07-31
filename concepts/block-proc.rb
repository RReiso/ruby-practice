lam = lambda {11}
p [1,2,3,4].find(lam) {|nr| nr > 10} # 11; if "find" fails, lambda is called
