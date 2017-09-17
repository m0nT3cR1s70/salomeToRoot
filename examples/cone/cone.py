import geompy
import salome
gg = salome.ImportComponentGUI("GEOM")

#creamos dos vertices y un vector a partir de los vertices
#p1 = geompy.MakeVertex(35, 35, 0)
#p2 = geompy.MakeVertex(35, 35, 70)
#v = geompy.MakeVector(p1, p2)

#creamos los conos
#cone1 = geompy.MakeCone(p1, v, 17, 1, 20)
cone = geompy.MakeConeR1R2H(30,10, 30)

#agregamos objetos al estudio
id_cone1 = geompy.addToStudy(cone1,"Cone1")
id_cone2 = geompy.addToStudy(cone2,"Cone2")

#Dibujamos los conos
gg.createAndDisplayGO(id_cone1)
gg.setDisplayMode(id_cone1,1)
gg.createAndDisplayGO(id_cone2)
gg.setDisplayMode(id_cone2,1)
