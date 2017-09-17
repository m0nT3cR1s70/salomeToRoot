#include "TGeoManager.h" 
void /Users/asul/Documents/Documentacion/compilador/integracion/salomeToRoot/examples/cube/mundo()
{
	 //We call the admin. geometry
	 new TGeoManager("world","simple");

	 //We define the means and the material
	 TGeoMaterial *mat=new TGeoMaterial("Vacuum",0,0,0);
	 TGeoMedium   *med=new TGeoMedium("Vacuum",1,mat);

	 //Define the world 
	 TGeoVolume *top=gGeoManager->MakeBox("top",med,1.000000,1.000000,1.000000);
	 gGeoManager->SetTopVolume(top);

	 //We define position 
	 TGeoRotation    *rot = new TGeoRotation("rot",0.,180,0); 
	 TGeoCombiTrans  *transf = new TGeoCombiTrans(0,0,-100,rot); 

	//We define a geometry 
	TGeoVolume *caja1=gGeoManager->MakeBox("caja1",med,200.000000,200.000000,200.000000); 
	top->AddNode(caja1,0, transf);

	//We define a geometry 
	TGeoVolume *caja1=gGeoManager->MakeBox("caja1",med,200.000000,200.000000,200.000000); 
	top->AddNode(caja1,0, transf);

	 //We closed geometry
	 gGeoManager->CloseGeometry();

	 //Indicate the color cube
	 top->SetLineColor(kMagenta);

	 //We sent a draw the cube
	 gGeoManager->SetTopVisible();
	 top->Draw();
}
