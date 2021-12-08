# ==============================================================================
# Updated:      2021-11-01
# Created by:   Justin Johns
# Filename:     PS.SSL.psm1
# ==============================================================================

# IMPORT ALL FUNCTIONS
foreach ( $directory in @('Public', 'Private') ) {
    foreach ( $fn in (Get-ChildItem -Path "$PSScriptRoot\$directory\*.ps1") ) { . $fn.FullName }
}

# VARIABLES
New-Variable -Name 'CSR_Template' -Option ReadOnly -Value @(
    '[req]'
    'distinguished_name = req_distinguished_name'
    'req_extensions = v3_req'
    'default_bits = 2048'
    'default_md = sha256'
    'prompt = no'
    '[req_distinguished_name]'
    'C = #C#'
    'ST = #ST#'
    'L = #L#'
    'O = #O#'
    'OU = #OU#'
    'emailAddress="#E#"'
    'CN = #CN#'
    '[v3_req]'
    'keyUsage = keyEncipherment, dataEncipherment'
    'extendedKeyUsage = serverAuth'
    'subjectAltName = @alt_names'
    '[alt_names]'
    'DNS.1 = #CN#'
    'DNS.2 = #SAN1#'
    'DNS.3 = #SAN2#'
    'DNS.4 = #SAN3#'
)

# EXPORT MEMBERS
# THESE ARE SPECIFIED IN THE MODULE MANIFEST AND THEREFORE DON'T NEED TO BE LISTED HERE
#Export-ModuleMember -Function *
Export-ModuleMember -Variable 'CSR_Template'