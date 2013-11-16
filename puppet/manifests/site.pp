# test
#
#

node 'admin2.example.com' {

  $msg = hiera('messageEnv')
  notify { "message ${msg}" :} 

}

