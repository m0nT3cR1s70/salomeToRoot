#include "TGeoManager.h" 
void disc()
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
	TGeoVolume *isk1 =gGeoManager->MakeTorus("disk1 ",med,100.000000,0,0,0,360); 
	top->AddNode(disk1 ,0,transf);

	 //We closed geometry
	 gGeoManager->CloseGeometry();

	 //Indicate the color cube
	 top->SetLineColor(kMagenta);

	 //We sent a draw the cube
	 gGeoManager->SetTopVisible();
	 top->Draw();
}
