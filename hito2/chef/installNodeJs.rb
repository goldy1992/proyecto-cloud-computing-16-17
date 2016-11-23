name "NodeJs" 
description "Install NodeJs" 
run_list "recipe[nodejs]"  
default_attributes "nodejs" => { "engine" => "node", 
                               "install_method" => "package", 
                                "oracle" => { "accept_oracle_download_terms" => true } 
                             }  
