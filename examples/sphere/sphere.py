#import salome
#import geompy 
gg = salome.ImportComponentGUI("GEOM")

#creamos un vertice
#p = geompy.MakeVertex(55, 45, 25)

#definimos los radios de la esfera y a las esferas
#radius1 = 20
#sphere1 = geompy.MakeSpherePntR(p, radius1)
#radius2 = 15
#sphere2 = geompy.MakeSphere(0, 0, 45, radius2)
radius3 = 30
sphere3 = geompy.MakeSphereR(200)

#Agregamos el objeto al estudio
id_sphere1 = geompy.addToStudy(sphere1,"Sphere1")
id_sphere2 = geompy.addToStudy(sphere2,"Sphere2")
id_sphere3 = geompy.addToStudy(sphere3,"Sphere3")

#Dibujamos las esferas sobre el canvas
gg.createAndDisplayGO(id_sphere1)
gg.setDisplayMode(id_sphere1,1)
gg.createAndDisplayGO(id_sphere2)
gg.setDisplayMode(id_sphere2,1)
gg.createAndDisplayGO(id_sphere3)
gg.setDisplayMode(id_sphere3,1)
