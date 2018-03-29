notify { 'devsite.pp': }
$role=hiera('role')
include $role

