name "java" 
description "Install Oracle Java" 
run_list "recipe[java]"  
default_attributes "java" => { "install_flavor" => "oracle", 
                               "jdk_version" => "8", 
                                "oracle" => { "accept_oracle_download_terms" => true } 
                             }  
