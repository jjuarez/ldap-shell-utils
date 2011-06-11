module LdapShellUtils
  module Version
    INFO = {
      :major =>0,
      :minor =>1,
      :patch =>0
    }

    NAME    = 'ldap-shell-utils'
    VERSION = [ INFO[:major], INFO[:minor], INFO[:patch] ].join( '.' )
  end
end
