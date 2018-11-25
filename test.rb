pid = fork do 
  # exec 'bin/betfair monitor -m 1.149127014 -s 31162 -t 5 -i 3'
  exec 'bin/betfair events'
end
