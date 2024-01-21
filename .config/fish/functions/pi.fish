function pi --wraps='ssh cs@192.168.0.250' --description 'alias pi=ssh cs@192.168.0.250'
  ssh cs@192.168.0.250 $argv
        
end
