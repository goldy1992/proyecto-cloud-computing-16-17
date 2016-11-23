name "NodeJs" 
description "Install NodeJs" 
run_list "recipe[nodejs]"  
default_attributes "nodejs" => { "engine" => "node", 
                               "install_method" => "binary", 
				"version" => "6.9.1" 
                             }  
