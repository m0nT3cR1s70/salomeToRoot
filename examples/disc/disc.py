import geompy
import salome
gg = salome.ImportComponentGUI("GEOM")

#creamos vertices
#p0 = geompy.MakeVertex(0.,0.,0.)
#px = geompy.MakeVertex(100.,0.,0.)
#py = geompy.MakeVertex(0.,100.,0.)
#pz = geompy.MakeVertex(0., 0., 100.)

#creamos un vector dados dos puntos
#vxy  = geompy.MakeVector(px, py)

#creamos un disco sobre el plano XY
disk1 = geompy.MakeDiskR(100, 1)

# creamos un disco desde un punto,un vector y un radio
#disk2 = geompy.MakeDiskPntVecR(pz, vxy, 30)

#creamos un disco desde un punto
#disk3 = geompy.MakeDiskThreePnt(p0, px, py)

#Agregamos objetos al estudio
id_vxy    = geompy.addToStudy(vxy,  "Vector")
id_disk1  = geompy.addToStudy(disk1,"Disk1")
id_disk2  = geompy.addToStudy(disk2,"Disk2")
id_disk3  = geompy.addToStudy(disk3,"Disk3")

#Dibujamos los discos
gg.createAndDisplayGO(id_vxy)
gg.createAndDisplayGO(id_disk1)
gg.createAndDisplayGO(id_diks2)
gg.createAndDisplayGO(id_diks3)
