USES GraphABC;
BEGIN
SetWindowTitle('КИТ');
SetPenWidth(3);
SetWindowSize (500,500);
Arc (250,250,100,10,180);
Line (150,250,420,250);
Line (420,250,400,230);
Line (400,230,400,200);
Line (400,200,375,232);
Line (375,232,348,232);
FloodFill (250,230,clBlue);
Circle (230,190,10);
SetBrushColor (clBlack);
FillCircle (233,193,4);
SetBrushColor (clRed);
Arc (220,223,30,368,300);
SetBrushColor (clLightBlue);
END.