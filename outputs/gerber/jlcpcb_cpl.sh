#!/bin/bash

cp hhkb-bottom-pos.csv jlcpcb-cpl-bottom.csv
cp hhkb-top-pos.csv jlcpcb-cpl-top.csv

perl -pi -e "s/Ref,Val,Package,PosX,PosY,Rot,Side/Designator,Mid X,Mid Y,Rotation,Layer/" jlcpcb-cpl*.csv
perl -pi -e 's/","[^"]*","[^"]*"/"/' jlcpcb-cpl*.csv

# manual placement fix
perl -pi -e 's/"U1",(.*),-90/"U1",\1,0/' jlcpcb-cpl*.csv
perl -pi -e 's/"J1",(.*),0.000000/"J1",\1,180.000000/' jlcpcb-cpl*.csv
