import geompy
import salome
gg=salome.ImportComponentGUI("GEOM")

#Creamos un cubo
caja1=geompy.MakeBoxDXDYDZ(200,200,200)

#Agregamos los objetos al estudio
id_caja1=geompy.addToStudy(caja1,"caja1")

#muestra las cajas
gg.createAndDisplayGO(id_caja1)
gg.setDisplayMode(id_caja1,1)
