export OSOAA_ROOT=/home/vcousineaudaoust/Documents/OSOAA/RadiativeTransferCode-OSOAA/
max=40 # Number of iterations (adjusts wavelength range, see for loop)
SZA=30.00 #Solar Zenith-Angle
PHYTO_CHL=0 # Phytoplankton concentration (mg/m3)
CSED=0 # Mineral-like particles concentration (mg/m3)
VIEWLVL=3 # Standard output at z=0+. We could take the results directly in the "Advanced outputs", which would make this variable obsolete.
PHYTO_PROFILTYPE=2 # Gaussian shaped phytoplantkon profile
PHYTO_GP_CHLBG=1 #LAKE SUP: 1mg/m3
PHYTO_GP_DEEP=0 #LAKE SUP: 30 m
PHYTO_GP_WIDTH=5 #LAKE SUP: 7.5 m
SEA_DEPTH=150 #LAKE SUP: 150 m
SEA_WIND=5 #LAKE SUP: 5 m/s
echo "Wavelength (um);Stokes I @ z=0+;Reflectance @ z=0+;Stokes I @ TOA" >> $OSOAA_ROOT/test/results_z0.txt
for (( i=0; i <= $max; ++i ))
do
	WAVELENGTH=$(echo "scale=3;  0.4+$i*0.01" | bc -l)
	/home/vcousineaudaoust/Documents/OSOAA/RadiativeTransferCode-OSOAA/exe/OSOAA_MAIN.exe -AER.AOTref 0.2 -AER.DirMie /home/vcousineaudaoust/Documents/OSOAA/RadiativeTransferCode-OSOAA/DATABASE/MIE_AER/ -AER.Log AEROSOLS.Log -AER.Model 2 -AER.ResFile PM_AER.txt -AER.SF.Model 3 -AER.SF.RH 98.00 -AER.Tronca 1 -AER.Waref 0.55 -ANG.Log ANGLES.Log -ANG.Mie.NbGauss 40 -ANG.Mie.ResFile MIE_UsedAngles.txt -ANG.Rad.NbGauss 48 -ANG.Rad.ResFile RAD_UsedAngles.txt -ANG.Thetas "$SZA" -AP.HA 3.00 -AP.HR 8.00 -AP.Pressure 1013.00 -DET.Abs440 0.00 -DET.Swa 0.011 -HYD.DirMie /home/vcousineaudaoust/Documents/OSOAA/RadiativeTransferCode-OSOAA/DATABASE/MIE_HYD -HYD.Model 1 -MLP.ResFile PM_MLP.txt -OSOAA.Log Main.Log -OSOAA.ResFile.Adv.Down ResADV_DOWN.txt -OSOAA.ResFile.Adv.Up ResADV_UP.txt -OSOAA.ResFile.vsVZA LUM_vsVZA.txt -OSOAA.ResFile.vsZ ResVsZ.txt -OSOAA.ResRoot /home/vcousineaudaoust/Documents/OSOAA/RadiativeTransferCode-OSOAA/test -OSOAA.View.Level "$VIEWLVL" -OSOAA.View.Phi 0.00 -OSOAA.View.VZA 0.00 -OSOAA.Wa "$WAVELENGTH" -PHYTO.Chl "$PHYTO_CHL" -PHYTO.GP.Chlbg "$PHYTO_GP_CHLBG" -PHYTO.GP.Deep "$PHYTO_GP_DEEP" -PHYTO.GP.Width "$PHYTO_GP_WIDTH" -PHYTO.JD.MIwa 0.00 -PHYTO.JD.MRwa 1.05 -PHYTO.JD.rate 1.00 -PHYTO.JD.rmax 200.00 -PHYTO.JD.rmin 0.01 -PHYTO.JD.slope 4.00 -PHYTO.LND.SM.MIwa 0.00 -PHYTO.LND.SM.MRwa 0.00 -PHYTO.LND.SM.SDradius 0.00 -PHYTO.LND.SM.SDvar 0.00 -PHYTO.LND.SM.rate 0.00 -PHYTO.LND.TM.MIwa 0.00 -PHYTO.LND.TM.MRwa 0.00 -PHYTO.LND.TM.SDradius 0.00 -PHYTO.LND.TM.SDvar 0.00 -PHYTO.LND.TM.rate 0.00 -PHYTO.ProfilType "$PHYTO_PROFILTYPE" -PHYTO.ResFile PM_PHYTO.txt -PROFILE_ATM.ResFile PROFILE_ATM.txt -PROFILE_SEA.ResFile PROFILE_SEA.txt -SEA.BotAlb 0.2 -SEA.BotType 1 -SEA.Depth "$SEA_DEPTH" -SEA.Dir /home/vcousineaudaoust/Documents/OSOAA/RadiativeTransferCode-OSOAA/DATABASE/SURF_MATR -SEA.Ind 1.34 -SEA.Log SEA.Log -SEA.SurfAlb 0.00 -SEA.Wind "$SEA_WIND" -SED.Csed "$CSED" -SED.JD.MIwa -0.0025 -SED.JD.MRwa 1.15 -SED.JD.rate 1.00 -SED.JD.rmax 200.00 -SED.JD.rmin 0.01 -SED.JD.slope 4.00 -SED.LND.SM.MIwa 0.00 -SED.LND.SM.MRwa 0.00 -SED.LND.SM.SDradius 0.00 -SED.LND.SM.SDvar 0.00 -SED.LND.SM.rate 0.00 -SED.LND.TM.MIwa 0.00 -SED.LND.TM.MRwa 0.00 -SED.LND.TM.SDradius 0.00 -SED.LND.TM.SDvar 0.00 -SED.LND.TM.rate 0.00 -SOS.IGmax 100 -SOS.Log SOS.Log -SOS.ResFile.Bin LUM_SF.bin -YS.Abs440 0.00 -YS.Swa 0.014
	VAR="$(awk 'NR==80{print $3,";",$4}' $OSOAA_ROOT/test/Standard_outputs/LUM_vsVZA.txt)"
	VAR2="$(awk 'NR==83{print $5}' $OSOAA_ROOT/test/Advanced_outputs/ResADV_UP.txt)"
	echo "$WAVELENGTH;$VAR;$VAR2"
	echo "$WAVELENGTH;$VAR;$VAR2" >> $OSOAA_ROOT/test/results_z0.txt
done
