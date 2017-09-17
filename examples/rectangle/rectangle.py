#import salome
#import geompy
gg=salome.ImportComponetGUI("GEOM")

#Creamos los vertices del rectangulo
#px = geompy.MakeVertex(100.,0.,0.)
#py = geompy.MakeVertex(0.,100.,0.)

# creamos un vector dadas dos coordenadas geometrica
#vxy  = geompy.MakeVector(px, py)

# Creamos un rectangulo en el plano XY
face1 = geompy.MakeFaceHW(100, 100, 3)

#creamos un rectangulo usando un vector
#face2 = geompy.MakeFaceObjHW(vxy, 50, 150)

#creamos otro rectangulo con otra cara
#face3 = geompy.MakeFaceObjHW(face2, 150, 50)

#agregamos los objetos al estudio
id_face1  = geompy.addToStudy(face1,"Face1")
id_face2  = geompy.addToStudy(face2,"Face2")
id_face3  = geompy.addToStudy(face3,"Face3")

#dibujamos las figuras
gg.createAndDisplayGO(id_face1)
gg.createAndDisplayGO(id_face2)
gg.createAndDisplayGO(id_face3)
