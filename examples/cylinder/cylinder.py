import geompy
import salome

gg=salome.ImportComponentGUI("GEOM")

#Creamos los Cilindros
%cilindro1=geompy.MakeCylinderRH(23,56)
cili?ndro2=geompy.MakeCylinderRH(300,100)

#Agregamos el objeto al estudio
id_cilindro1=geompy.addToStudy(cilindro1,"cilindro1")
id_cilindro2=geompy.addToStudy(cilindro2,"cilindro2")

#mostramos los cilindros
gg.createAndDisplayGO(id_cilindro1)
gg.setDisplayMode(id_cilindro1,1)
gg.createAndDisplayGO(id_cilindro2)
gg.setDisplayMode(id_cilindro2,1)





