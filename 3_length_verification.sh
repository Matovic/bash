#!/bin/bash
: '
chceme overiť nielen jeho minimálnu dĺžku, ale aj maximálnu. A teda urob to tak, aby bralo do úvahy len heslá ktoré majú od 6 do 10 znakov. Vrátane.
'

argc=$#
if [ $argc -ne 1 ]
then
echo Wrong parameters!
exit
fi

heslo=$1
if [ ${#heslo} -lt 6 -o ${#heslo} -gt 10 ]
then
echo Wrong length!
exit
fi

echo Heslo $heslo o dlzke ${#heslo} je ok!
