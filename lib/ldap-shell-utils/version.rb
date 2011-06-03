module LdapShellUtils
  module Version
    INFO = {
      :major =>0,
      :minor =>0,
      :patch =>3
    }

    NAME    = 'ldap-shell-utils'
    VERSION = [ INFO[:major], INFO[:minor], INFO[:patch] ].join( '.' )
  end
end
