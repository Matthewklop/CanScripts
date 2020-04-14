a=10
b=10
CanID=100
CanData="  99 99" #can to seatch with spaces | also double space at start "optional"
CanToSend="vcan0 100#0000000000000000"

while [ $a = $b ] 
do
#after grep put ID
  st1=$(timeout 0.1s candump vcan0 | grep  "$CanID" | cut -d "]" -f2)	
printf "$st1"
# after = put data in quote
if [ "$st1" = "$CanData" ]; then
echo " !string found! "
cansend $CanToSend
fi
st=""
done
