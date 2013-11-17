# test
#
#

node 'admin2.example.com' {

    $msg = hiera('messageEnv')
    notice "message ${msg}" 

    # read all server entries from hiera yaml
    $entries = hiera_array('servers')

    $entries.each |$index5,$value5| { 
        notice "----"
        notice $index5

        $entries[$index5].each |$index6,$value6| {
            #global params
            notice $index6
            $value6['global_parameters'].each |$index,$value| { 
                if ( $index != 'params') {
                    notice "global $index $value" 
                } else {
                    # params 
                    $parameters = $value 
                    $parameters.each |$value2| { 
                        notice "global parameters $value2" 
                    }
                }
            }          

            $value6['entries'].each |$index,$value| { 
                $value.each |$index2,$value2| {
                    if ( $index2 != 'params') {
                        notice "entry $index2 $value2" 
                    } else {
                        # params 
                        $parameters = $value2 
                        $parameters.each |$value3| { 
                            notice "entry parameters $value3" 
                        }
                    }
                }
            } 


        }

    } 
    notice "----"

}

