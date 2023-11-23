#!/bin/bash
PS3='Choose AWS Account: '
account=("Eduspire" "Taylor&Hart" "VWFS" "EN" "Quit")
select fav in "${account[@]}"; do
    case $fav in
	 "EN")
            read -p "MFA Code: " mfa
            sh ~/mfa.sh $mfa en en-mfa
            break
            ;;
        "Eduspire")
	    read -p "MFA Code: " mfa      
            sh ~/mfa.sh $mfa eduspire eduspire-mfa
	    break
            ;;
        "Taylor&Hart")
            read -p "MFA Code: " mfa
            sh ~/mfa.sh $mfa taylorandhart taylorandhart-mfa
	    break
            ;;
	"VWFS")
	    export AWS_PROFILE=vwfs
	    KUBE_CONFIG_PATH="~/.kube/config"
	    saml2aws login --force
            break
            ;;
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
