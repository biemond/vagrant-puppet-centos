# test
#
#

node 'node10.example.com', 'node20.example.com' {

  $msg = hiera('messageEnv')
  notify { "message ${msg}" :} 


}

