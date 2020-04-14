#run this file by typing "sh canscript.sh"

a=10
b=10
funcOn="vcan0 100 "
while [ $a = $b ] 
do
#after grep put ID
  st1=$(timeout 0.1s candump vcan0 | grep  "100" | cut -d "]" -f2)	
printf "$st1"
# after = put data in quote
if [ "$st1" = "  99 99" ]; then
echo string found
cansend vcan0 100#0000000000000000
fi
st=""
done
