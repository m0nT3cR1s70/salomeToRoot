import geompy
import salome
gg = salome.ImportComponentGUI("GEOM")

#creamos dos vertices y un vector
#p1 = geompy.MakeVertex(35, 40, 45)
#p2 = geompy.MakeVertex(35, 45, 70)
#v = geompy.MakeVector(p1, p2)

#creamos los toroides
#torus1 = geompy.MakeTorus(p1, v, 20, 10)
torus2 = geompy.MakeTorusRR(300, 150)

#agregamos los objetos al estudio
id_torus1 = geompy.addToStudy(torus1,"Torus1")
id_torus2 = geompy.addToStudy(torus2,"Torus2")

#dibujamos los toroides
gg.createAndDisplayGO(id_torus1)
gg.setDisplayMode(id_torus1,1)
gg.createAndDisplayGO(id_torus2)
gg.setDisplayMode(id_torus2,1)
