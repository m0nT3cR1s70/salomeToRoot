#include "TGeoManager.h" 
void sphere()
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
	TGeoVolume *sphere3 =gGeoManager->MakeSphere("sphere3 ",med,0,200.000000,0,180,0,360); 
	top->AddNode(sphere3 ,0,transf);

	 //We closed geometry
	 gGeoManager->CloseGeometry();

	 //Indicate the color cube
	 top->SetLineColor(kMagenta);

	 //We sent a draw the cube
	 gGeoManager->SetTopVisible();
	 top->Draw();
}
