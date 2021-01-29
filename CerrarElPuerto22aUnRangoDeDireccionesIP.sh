echo "Ingrese la dirección ip"
                read ip2
                iptables -D INPUT -p icmp -s $ip2 -j DROP
                echo " desbloqueado el ping remoto"
        ;;
        5)
                echo "Ingrese la dirección ip"
                read ip3
                iptables -A INPUT -p tcp -s $ip3 --dport 22 -j DROP
                echo "cerrado el puerto 22"
        ;;
        6)
                echo "Ingrese la dirección ip"
                read ip4
                iptables -D INPUT -p tcp -s $ip4 --dport 22 -j DROP
                echo " permitido el puerto 22 "
        ;;
        7)
                echo "Ingrese la dirección mac"
                read mac
                iptables -A INPUT -p tcp --dport 22 -m mac --mac-s $mac -j DROP
                echo "Se a cerrado el puerto 22 "
        ;;
        8)
                echo "Ingrese la dirección "
                read mac2
                iptables -D INPUT -p tcp --dport 22 -m mac --mac-source $mac2 -j DROP
                echo "Se a desbloqueado el puerto 22  "
        ;;
        9)
                echo "Estado de  reglas"
                iptables -nL
        ;;

        10)
                exit
        ;;

	*)
                echo "presiona otra opción"
        ;;
                esac

done