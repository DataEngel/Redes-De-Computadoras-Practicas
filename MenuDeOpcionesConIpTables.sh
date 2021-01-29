#/sbin

for((i=1;i>=1;i++))do 
        
        echo 'precione una de las sig opciones'  


        1 detener el firewall del sistema operativo
        2 inicializar el servicio de iptables
        3 dropear un ping remoto
        4 permitir un ping remoto
        5 cerrar puerto 22 a un equipo en especifico
        6 permitir puerto 22 a un equipo especifico
        7 cerrar puerto 22 por dirección Mac a un equipo especifico
        8  permitir puerto 22 por dirección Mac a un equipo especifico
        9 Checar el estado de las reglas
        10 salir del script 
        
        read caso
        case $caso in
        1)
                sudo ufw disable
                sudo ufw status
                echo "Se detubo el firewall del sistema operavivo"
        ;;
        2)
                sudo iptables -S           
                echo "se inicializo el servicio de iptables"
        ;;
        3)
                echo "Ingrese la dirección ip"
                read ip
                iptables -A INPUT -p icmp -s $ip -j DROP
                echo "el ping a sido dropeado correctamente"
        ;;
        4)
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